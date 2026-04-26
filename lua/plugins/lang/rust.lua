return {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  ft = { "rust" }, -- lazy load for Rust files only
  opts = {
    server = {
      on_attach = function(client, bufnr)
        local wk = require("which-key")
        wk.add({ -- Ensure mappings are buffer-specific
          ["<leader>cR"] = {
            function()
              vim.cmd.RustLsp("codeAction")
            end,
            desc = "Code Action",
            buffer = bufnr,
          },
          ["<leader>dr"] = {
            function()
              vim.cmd.RustLsp("debuggables")
            end,
            desc = "Rust Debuggables",
            buffer = bufnr,
          },
        })
      end,
      default_settings = {
        ["rust_analyzer"] = {
          cargo = {
            allFeatures = false, -- might improve performance
          },
          checkOnSave = {
            command = "check", -- use "check" instead of "clippy"
          },
          inlayHints = { -- Drop non-essential hints
            chainingHints = { enable = true },
            maxLength = 25,
          },
        },
      },
    },
  },
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
  end,
}
