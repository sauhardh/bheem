return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- js/ts
        eslint = {
          enabled = false,
        },
        -- ts/js/tsx
        vtsls = {
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

                diagnosticSeverityOverrides = {
                  reportUnusedImport = false,
                  reportUnusedClass = false,
                  reportUnusedFunction = false,
                  reportUnusedVariable = false,
                  reportDuplicateImport = false,
                },
              },
            },
          },
        },
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              lint = {
                enable = true,
              },
              format = {
                enable = true,
              },
            },
          },
        },

        -- rust - disabled here, using rustaceanvim instead (see rust.lua)
        rust_analyzer = { enabled = false },
        -- cpp
        clangd = {
          cmd = { "clangd", "--background-index" },
          filetypes = { "c", "cpp", "objc", "objcpp" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname)
          end,
        },
      },
    },
  },
}
