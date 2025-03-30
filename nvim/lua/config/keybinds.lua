vim.g.mapleader = " "

local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local function nmap(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

local imap_expr = function(lhs, rhs)
  vim.keymap.set('i', lhs, rhs, { expr = true })
end

imap_expr('<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

map("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>")
map("n", "<leader>sf", "<cmd>Pick files<cr>")
map("n", "<leader>sg", "<cmd>Pick grep_live<cr>")
map("n", "<leader>sb", "<cmd>Pick buffers<cr>")
map("n", "<leader>bn", "<cmd>bnext<cr>")
map("n", "<leader>bp", "<cmd>bprevious<cr>")
map("n", "<leader>bd", "<cmd>bdelete<cr>")

nmap("n", "<leader>qq", "<cmd>q<cr>")
map("n", "<C-s>", "<cmd>w<cr>")

map("n", "<leader>gh", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("v", "<C-k>", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "single" })<CR>')
map("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "single" })<CR>')
map("n", "gl", "<cmd>lua vim.diagnostic.open_float(0, {scope=\"line\"})<cr>")

map('n', '<leader>ff', '<cmd>lua vim.lsp.buf.format()<cr>')

map("n", "<M-k>", "<cmd>res +2<cr>")
map("n", "<M-j>", "<cmd>res -2<cr>")
map("n", "<M-h>", "<cmd>vertical res +2<cr>")
map("n", "<M-l>", "<cmd>vertical res -2<cr>")

map("v", "\"", "<esc>`>a\"<esc>`<i\"<esc>")
map("v", "'", "<esc>`>a'<esc>`<i'<esc>")
map("v", "(", "<esc>`>a)<esc>`<i(<esc>")
map("v", "[", "<esc>`>a]<esc>`<i[<esc>")
map("v", "{", "<esc>`>a}<esc>`<i{<esc>")

map("t", "<esc><esc>", "<c-\\><c-n>")

map('n', '<leader>ct', ':ToggleBackground<CR>')
