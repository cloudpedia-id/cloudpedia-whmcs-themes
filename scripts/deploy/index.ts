import SftpClient from "ssh2-sftp-client";
import * as path from "path";
import * as fs from "fs/promises";
import * as dotenv from "dotenv";
import z from "zod";
import { fileURLToPath } from "url";
import { dirname } from "path";

dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const configSchema = z.object({
  host: z.string().min(3),
  port: z.number(),
  username: z.string().min(3),
  password: z.string().min(3),
  sourcePath: z.string().min(3),
  destinationPath: z.string().min(3),
});

async function getLocalEntries(basePath: string, currentPath: string = ""): Promise<{ files: string[], dirs: string[] }> {
    const fullPath = path.join(basePath, currentPath);
    const entries = await fs.readdir(fullPath, { withFileTypes: true });
    let files: string[] = [];
    let dirs: string[] = [];

    for (const entry of entries) {
        const entryPath = path.posix.join(currentPath, entry.name);
        if (entry.isDirectory()) {
            dirs.push(entryPath);
            const subEntries = await getLocalEntries(basePath, entryPath);
            files = files.concat(subEntries.files);
            dirs = dirs.concat(subEntries.dirs);
        } else {
            files.push(entryPath);
        }
    }

    return { files, dirs };
}

async function getRemoteEntries(sftp: SftpClient, basePath: string, currentPath: string = ""): Promise<{ files: string[], dirs: string[] }> {
    const fullPath = path.posix.join(basePath, currentPath);
    const entries = await sftp.list(fullPath);
    let files: string[] = [];
    let dirs: string[] = [];

    for (const entry of entries) {
        const entryPath = path.posix.join(currentPath, entry.name);
        if (entry.type === 'd') {
            dirs.push(entryPath);
            const subEntries = await getRemoteEntries(sftp, basePath, entryPath);
            files = files.concat(subEntries.files);
            dirs = dirs.concat(subEntries.dirs);
        } else {
            files.push(entryPath);
        }
    }
    return { files, dirs };
}


async function uploadDirectory() {
  const sftp = new SftpClient();
  try {
    const sftpConfig = configSchema.parse({
      host: process.env.SFTP_HOST,
      port: Number(process.env.SFTP_PORT),
      username: process.env.SFTP_USERNAME,
      password: process.env.SFTP_PASSWORD,
      sourcePath: process.env.SOURCE_PATH,
      destinationPath: process.env.DESTINATION_PATH,
    });

    const localPath = path.resolve(__dirname, sftpConfig.sourcePath);
    const remotePath = sftpConfig.destinationPath;

    await sftp.connect(sftpConfig);
    console.log("Connected to SFTP server.");

    const exists = await sftp.exists(remotePath);
    if (!exists) {
      await sftp.mkdir(remotePath, true);
      console.log(`Created remote directory: ${remotePath}`);
    }

    // Sync remote with local
    console.log("Starting directory synchronization...");

    const { files: remoteFiles, dirs: remoteDirs } = await getRemoteEntries(sftp, remotePath);
    const { files: localFiles, dirs: localDirs } = await getLocalEntries(localPath);

    const localFileSet = new Set(localFiles);
    const localDirSet = new Set(localDirs);

    // Delete files from remote that are not in local
    const filesToDelete = remoteFiles.filter(remoteFile => !localFileSet.has(remoteFile));
    for (const fileToDelete of filesToDelete) {
        const remoteFilePath = path.posix.join(remotePath, fileToDelete);
        console.log(`Deleting remote file: ${remoteFilePath}`);
        await sftp.delete(remoteFilePath);
    }

    // Delete directories from remote that are not in local
    const dirsToDelete = remoteDirs.filter(remoteDir => !localDirSet.has(remoteDir));
    dirsToDelete.sort((a, b) => b.length - a.length); // Sort by length descending to delete deepest first

    for (const dirToDelete of dirsToDelete) {
        const remoteDirPath = path.posix.join(remotePath, dirToDelete);
        console.log(`Deleting remote directory: ${remoteDirPath}`);
        await sftp.rmdir(remoteDirPath); // rmdir is not recursive by default
    }

    console.log("Synchronization complete.");


    await sftp.uploadDir(localPath, remotePath);
    console.log(`Successfully uploaded ${localPath} to ${remotePath}`);
  } catch (err) {
    console.error("Error uploading directory:", err);
  } finally {
    sftp.end();
    console.log("SFTP connection closed.");
  }
}

uploadDirectory();