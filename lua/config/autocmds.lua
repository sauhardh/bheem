-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

-- Auto-detect Python interpreter and notify pyright so it picks up newly
-- installed packages (e.g. pip/conda install after nvim was already open)
-- without requiring a full Neovim restart or manual :LspRestart.
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("PyrightAutoPath", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or client.name ~= "pyright" then
      return
    end

    -- Resolve the best Python interpreter for this buffer's directory
    local function resolve_python()
      local buf_dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(args.buf), ":h")

      -- 1. Project-local .venv in current dir
      local venv = buf_dir .. "/.venv/bin/python"
      if vim.fn.executable(venv) == 1 then
        return venv
      end

      -- 2. Walk up to 5 levels looking for a .venv
      local dir = buf_dir
      for _ = 1, 5 do
        local parent = vim.fn.fnamemodify(dir, ":h")
        if parent == dir then
          break
        end
        dir = parent
        local pv = dir .. "/.venv/bin/python"
        if vim.fn.executable(pv) == 1 then
          return pv
        end
      end

      -- 3. Active conda env (set by `conda activate`)
      local conda_prefix = os.getenv("CONDA_PREFIX")
      if conda_prefix and vim.fn.executable(conda_prefix .. "/bin/python") == 1 then
        return conda_prefix .. "/bin/python"
      end

      -- 4. Miniconda base env
      local miniconda = vim.fn.expand("~/miniconda3/bin/python")
      if vim.fn.executable(miniconda) == 1 then
        return miniconda
      end

      -- 5. System python3 / python fallback
      local sys = vim.fn.exepath("python3")
      if sys ~= "" then
        return sys
      end
      return "python"
    end

    local python_path = resolve_python()

    -- Push the resolved path into the live pyright client settings
    if client.settings then
      client.settings.python = vim.tbl_deep_extend(
        "force",
        client.settings.python or {},
        { pythonPath = python_path }
      )
    else
      client.config.settings = vim.tbl_deep_extend(
        "force",
        client.config.settings or {},
        { python = { pythonPath = python_path } }
      )
    end
    -- Tell pyright to reload its configuration (picks up new site-packages)
    client:notify("workspace/didChangeConfiguration", { settings = nil })
  end,
})
