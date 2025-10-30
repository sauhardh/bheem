if true then
  return {}
end

-- This is what inside theme.lua.
-- theme.lua is mapped to omarchy config so its content is hidden in github
-- This function is to apply the colorscheme of "vscode"
return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
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
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
