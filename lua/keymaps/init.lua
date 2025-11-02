-- Goto Normal Mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Yank to clipboard
vim.keymap.set("v", "<C-c>", '"*y')

-- No highligh
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>")

-- <leader>j →  ALE (Prettier)
vim.keymap.set("n", "<leader>j", function()
  vim.cmd("ALEFix")
end, { noremap = true, silent = true, desc = "Format with ALE" })

-- <leader>f → LSP format
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true, desc = "LSP Format" })

-- LSP GotoDefinition
vim.keymap.set('n', 'gd', function()
  vim.lsp.buf.definition()
end, { desc = "Go to Definition" })

-- LSP GotoTypeDefinition
vim.keymap.set('n', 'gt', function()
  vim.lsp.buf.type_definition()
end, { desc = "Go to Type Definition" })

-- LSP show full Diag
vim.keymap.set('n', '<leader>d', function()
  vim.diagnostic.open_float(nil, { border = "rounded" })
end, { silent = true, desc = "Show diagnostics in float" })
-- Toggle Between Buffer
vim.keymap.set("n", "<leader><leader>", "<C-^>", { noremap = true, silent = true })

-- Split Screen Navigation
vim.keymap.set("n", "<C-j>", "<C-W><C-J>")
vim.keymap.set("n", "<C-k>", "<C-W><C-K>")
vim.keymap.set("n", "<C-l>", "<C-W><C-L>")
vim.keymap.set("n", "<C-h>", "<C-W><C-H>")

-- Save, quit, save+quit
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "<leader>q", ":q!<CR>")
vim.keymap.set("n", "<leader>wq", ":wq!<CR>")

-- Move lines
vim.keymap.set("n", "∆", ":m .+1<CR>==")
vim.keymap.set("n", "˚", ":m .-2<CR>==")
vim.keymap.set("v", "∆", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "˚", ":m '<-2<CR>gv=gv")

-- mini.completion
-- local imap_expr = function(lhs, rhs)
--   vim.keymap.set('i', lhs, rhs, { expr = true })
-- end
-- imap_expr('<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
-- imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- vim.keymap.set('i', '<CR>', 'v:lua.cr_action()', { expr = true })

