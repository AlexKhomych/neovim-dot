vim.g.mapleader = " "

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local imap_expr = function(lhs, rhs)
  vim.keymap.set('i', lhs, rhs, { expr = true })
end

imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

map("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>")

map("n", "<leader>bn", "<cmd>bnext<cr>")
map("n", "<leader>bp", "<cmd>bprevious<cr>")
map("n", "<leader>bd", "<cmd>bdelete<cr>")

map("n", "<leader>qq", "<cmd>q<cr>")
map("n", "<C-s>", "<cmd>w<cr>")

map("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float(0, {scope=\"line\"})<cr>")
map("n", "<leader>gh", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

map("n", "+", "<cmd>res +2<cr>")
map("n", "_", "<cmd>res -2<cr>")
map("n", "<leader>+", "<cmd>vertical res +2<cr>")
map("n", "<leader>_", "<cmd>vertical res -2<cr>")


map("v", "(", "<esc>`>a)<esc>`<i(<esc>")
map("v", "[", "<esc>`>a]<esc>`<i[<esc>")
map("v", "{", "<esc>`>a}<esc>`<i{<esc>")

map("t", "<esc><esc>", "<c-\\><c-n>")

map('n', '<leader>ct', ':ToggleBackground<CR>')

map('n', '<leader>ff', '<cmd>lua vim.lsp.buf.format()<cr>')
