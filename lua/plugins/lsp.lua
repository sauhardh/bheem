return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- js/ts
        eslint = {
          enabled = false,
        },
      },
      -- ts/js/tsx
      vtls = {
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = false,
            },
          },
        },
      },
      -- Python
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            },
          },
        },
      },
      -- rust
      rust_analyzer = {
        settings = {
          ["rust_analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
      -- cpp
      clangd = {
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
      },
    },
  },
}
