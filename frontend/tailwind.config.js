/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./*.html",
    "./**/*.html",
  ],
  theme: {
    extend: {
      backgroundImage: {
        'server': "url('/images/server.png')",
        'primary-gradient': 'linear-gradient(90deg, #F3A4FF 0%, #CCC3FF 100%)',
        'sidebar': 'linear-gradient(180deg, rgba(59,130,246,0.7) 27.64%, rgba(147,51,234,1) 95.52%)',
        'sidebar-menu': 'linear-gradient(90deg, rgba(59, 130, 246, 0.3) 0%, rgba(147, 51, 234, 0.3) 100%)',
      },
      boxShadow: {
        'primary-gradient-glow': '0 0 10px rgba(243, 164, 255, 0.6)',
        'sidebar-glow': '0 56px 64px -10px #8E7DF8, 0 64px 64px -30px #BD01FF',
        'sidebar-submenu-glow': '0 64px 64px -32px rgba(142, 125, 248, 0.56)',
      }
    },
  },
  plugins: [],
}

