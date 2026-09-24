return {
  {
    "mrcjkb/rustaceanvim",
    version = false, -- use the latest version compatible with Neovim 0.12
    opts = {
      -- Use the rustup-managed rust-analyzer, NOT the Mason standalone one.
      -- The Mason standalone build has no sysroot/stdlib, so Option<T>, Vec<T>
      -- etc. resolve as {unknown} and method completions (map, unwrap, etc.) are missing.
      server = {
        cmd = { vim.fn.expand("~/.cargo/bin/rust-analyzer") },
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = { enable = true },
            },
            checkOnSave = true,
            procMacro = { enable = true },
            inlayHints = {
              bindingModeHints = { enable = true },
              chainingHints = { enable = true },
              closingBraceHints = { enable = true, minLines = 25 },
              closureReturnTypeHints = { enable = "always" },
              lifetimeElisionHints = { enable = "always", useParameterNames = true },
              parameterHints = { enable = true },
              reborrowHints = { enable = "always" },
              renderColons = true,
              typeHints = {
                enable = true,
                hideClosureInitialization = false,
                hideNamedConstructor = false,
              },
            },
          },
        },
      },
    },
  },
}
