vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Copy in visual mode
map("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })

-- Exit insert mode
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "No highlight" })

-- Window navigation handled by vim-kitty-navigator (<C-h/j/k/l>)

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better paste (don't overwrite register)
map("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })

-- Delete to void register
map({ "n", "v" }, "<leader>x", [["_d]], { desc = "Delete to void register" })

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader><leader>", "<cmd>b#<CR>", { desc = "Switch to last buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Toggle whitespace visibility
map("n", "<leader>w", "<cmd>set list!<CR>", { desc = "Toggle whitespace" })

-- Quick save
map("n", "<leader>s", "<cmd>w<CR>", { desc = "Save file" })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Better indenting (stay in visual mode)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Diagnostic navigation
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })
