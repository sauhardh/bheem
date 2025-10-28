return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      ensure_installed = {
        "pyright",
        "rust-analyzer",
        "eslint-lsp",
        "vtsls",
      },
    },
  },
}
