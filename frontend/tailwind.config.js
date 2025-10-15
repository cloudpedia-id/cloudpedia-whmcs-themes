/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./*.html",
    "./**/*.html",
  ],
  theme: {
    extend: {
      backgroundImage: {
        'nav-grad': 'linear-gradient(90deg, #F3A4FF 0%, #CCC3FF 100%)',
      },
      boxShadow: {
        'nav-hover': '0 0 10px rgba(243, 164, 255, 0.6)',
      }
    },
  },
  plugins: [],
}

