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
        "clangd",
      },
    },
  },
  {
    "3rd/image.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("image").setup({
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "md" },
          },
          neorg = {
            enabled = true,
          },
        },
        kitty_method = "normal", -- or "placeholders" (optional)
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = 50,
        max_height_window_percentage = 50,
      })
    end,
  },
}
