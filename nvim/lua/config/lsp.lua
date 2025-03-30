local nvim_lsp = require('lspconfig')
local api = vim.api

local function on_attach(client, bufnr)
  -- api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- api.nvim_buf_set_option(bufnr, "completefunc", "v:lua.vim.lsp.omnifunc")
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.MiniCompletion.completefunc_lsp")
  api.nvim_buf_set_option(bufnr, "completefunc", "v:lua.MiniCompletion.completefunc_lsp")

  api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  if client.server_capabilities.definitionProvider then
    api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  end
end

local servers = { 'gopls', 'ts_ls', 'lua_ls' }

local lsp_settings = {
  lua_ls = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    }
  }
}

for _, lsp in ipairs(servers) do
  local server_opts = {
    on_attach = on_attach
  }

  if lsp_settings[lsp] then
    server_opts.settings = lsp_settings[lsp]
  end

  nvim_lsp[lsp].setup(server_opts)
end
