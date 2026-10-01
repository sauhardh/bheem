-- C# / .NET language support
-- LSP:       seblyng/roslyn.nvim (VS Code Roslyn engine, via Mason)
-- Formatter: csharpier (via conform.nvim)
-- Debug:     nvim-dap + netcoredbg
return {
  -- ── Treesitter ──────────────────────────────────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c_sharp" },
    },
  },

  -- ── Roslyn LSP ──────────────────────────────────────────────────────────
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      config = {
        settings = {
          -- Inlay hints — full set for VS-grade experience
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
          },
          -- Code analysis / diagnostics
          ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "fullSolution",
            dotnet_compiler_diagnostics_scope = "fullSolution",
          },
          -- Completion
          ["csharp|completion"] = {
            dotnet_provide_regex_completions = true,
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
        },
      },
    },
  },

  -- ── Formatter: CSharpier ────────────────────────────────────────────────
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },
      formatters = {
        csharpier = {
          -- Mason installs csharpier; the binary is 'dotnet-csharpier'
          command = "dotnet-csharpier",
          args = { "--write-stdout" },
          stdin = true,
        },
      },
    },
  },

  -- ── DAP: netcoredbg ─────────────────────────────────────────────────────
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      -- Locate netcoredbg: prefer PATH, fall back to ~/.local/bin
      local netcoredbg = vim.fn.exepath("netcoredbg")
      if netcoredbg == "" then
        netcoredbg = vim.fn.expand("~/.local/bin/netcoredbg")
      end

      dap.adapters.coreclr = {
        type = "executable",
        command = netcoredbg,
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch - dotnet run",
          request = "launch",
          -- Prompt for the DLL path each time; autocompletes under bin/Debug/
          program = function()
            return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
        },
        {
          type = "coreclr",
          name = "Attach - running process",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }
    end,
  },
}
