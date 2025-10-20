import SftpClient from "ssh2-sftp-client";
import * as path from "path";
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
