-- TypeScript/JavaScript language support
return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "typescript", "javascript", "tsx", "css", "scss", "json", "graphql" },
    },
  },
  -- LSP settings are in lsp/init.lua (vtsls, eslint)
}
