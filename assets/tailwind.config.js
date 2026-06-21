const path = require("path")

module.exports = {
  content: [
    path.join(__dirname, "../lib/techstore/web/**/*.ex"),
    path.join(__dirname, "../lib/techstore/web/**/*.heex"),
    path.join(__dirname, "../deps/**/lib/**/*.ex"),
  ],
  darkMode: "class",
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter", "system-ui", "sans-serif"],
        mono: ["JetBrains Mono", "monospace"],
      },
      colors: {
        gray: {
          950: "#0a0a0f",
          900: "#111118",
          800: "#1a1a25",
          700: "#2a2a3a",
          600: "#4a4a5a",
          500: "#7a7a8a",
          400: "#a0a0b0",
          300: "#c0c0d0",
          200: "#e0e0e8",
          100: "#f0f0f5",
        },
        cyan: {
          400: "#22d3ee",
          500: "#06b6d4",
          600: "#0891b2",
        },
        violet: {
          400: "#a78bfa",
          500: "#8b5cf6",
        },
      },
      animation: {
        "fade-in": "fadeIn 0.5s ease-out",
        "slide-up": "slideUp 0.5s ease-out",
      },
      keyframes: {
        fadeIn: { "0%": { opacity: "0" }, "100%": { opacity: "1" } },
        slideUp: { "0%": { opacity: "0", transform: "translateY(10px)" }, "100%": { opacity: "1", transform: "translateY(0)" } },
      },
    },
  },
  plugins: [],
}
