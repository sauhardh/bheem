-- Python language support
-- LSP: pyright + ruff
return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "python" },
    },
  },
  -- LSP settings are in lsp/init.lua (pyright, ruff)
  -- This file is for Python-specific plugins if you add any later
}
