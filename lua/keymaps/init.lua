-- Goto Normal Mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
 
-- Yank to clipboard
vim.keymap.set("v", "<C-c>", '"*y')

-- LSP Format
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { noremap = true, silent = true })

-- LSP GotoDefinition
vim.keymap.set('n', 'gd', function()
  vim.lsp.buf.definition()
end, { desc = "Go to Type Definition" })

-- LSP GotoTypeDefinition
vim.keymap.set('n', 'gt', function()
  vim.lsp.buf.type_definition()
end, { desc = "Go to Type Definition" })
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
vim.api.nvim_set_keymap('i', '<Tab>',
  [[pumvisible() ? "\<C-n>" : "\<Tab>"]],
  { noremap = true, expr = true, silent = true }
)

vim.api.nvim_set_keymap('i', '<S-Tab>',
  [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],
  { noremap = true, expr = true, silent = true }
)
