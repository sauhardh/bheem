-- C/C++ language support
return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c", "cpp" },
    },
  },
  -- LSP settings are in lsp/init.lua (clangd)
}
