local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify()
end)
now(function() require('mini.icons').setup() end)
now(function() require('mini.files').setup() end)
now(function() require('mini.tabline').setup() end)
now(function() require('mini.pairs').setup() end)
now(function() require('mini.statusline').setup() end)

later(function() require('mini.completion').setup() end)
later(function() require('mini.pick').setup() end)
later(function() require('mini.comment').setup() end)
later(function() require('mini.surround').setup() end)

add({
  source = 'neovim/nvim-lspconfig',
  depends = { 'williamboman/mason.nvim' },
})

add({
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = 'master',
  monitor = 'main',
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'vimdoc' },
  highlight = { enable = true },
})

add({
  source = 'sainnhe/everforest',
})

later(function()
  vim.g.everforest_enable_italic = true
  vim.cmd('colorscheme everforest')
end)
