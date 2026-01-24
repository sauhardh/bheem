-- All colorscheme plugins + active theme configuration
return {
  -- Active theme
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup({
        style = "dark",
        transparent = false,
        semantic_tokens = true,
        italic = true,
        underline_links = true,
        disable_nvimtree_bg = true,
      })
      vim.cmd.colorscheme("vscode")
    end,
  },
  -- Set LazyVim colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
      news = {
        lazyvim = false,
        neovim = false,
      },
    },
  },
  -- Other available themes (lazy loaded)
  -- { "ribru17/bamboo.nvim", lazy = true, priority = 1000 },
  -- { "catppuccin/nvim", name = "catppuccin", lazy = true, priority = 1000 },
  -- { "sainnhe/everforest", lazy = true, priority = 1000 },
  -- { "kepano/flexoki-neovim", lazy = true, priority = 1000 },
  -- { "ellisonleao/gruvbox.nvim", lazy = true, priority = 1000 },
  -- { "rebelot/kanagawa.nvim", lazy = true, priority = 1000 },
  -- { "tahayvr/matteblack.nvim", lazy = true, priority = 1000 },
  -- { "loctvl842/monokai-pro.nvim", lazy = true, priority = 1000 },
  -- { "shaunsingh/nord.nvim", lazy = true, priority = 1000 },
  -- { "rose-pine/neovim", name = "rose-pine", lazy = true, priority = 1000 },
  -- { "folke/tokyonight.nvim", lazy = true, priority = 1000 },
}
