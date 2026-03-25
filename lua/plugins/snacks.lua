return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
          ignored = false,
          -- exclude = { "node_modules", "dist", "build", ".git", "*.lock" },
        },
        grep = {
          hidden = true,
          ignored = false,
          exclude = { "node_modules", "dist", "build", ".git", "*.lock" },
        },
      },
    },
  },
}
