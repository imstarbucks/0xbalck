-- BASIC EDITING
vim.opt.hidden = true                 -- Keep buffers in memory
vim.opt.number = true                 -- Show line numbers
vim.opt.relativenumber = true         -- Relative numbers for easy jumps
vim.opt.scrolloff = 10                -- Keep cursor centered vertically

-- INDENTATION
vim.opt.expandtab = true              -- Use spaces instead of tabs
vim.opt.tabstop = 2                   -- Number of spaces per tab
vim.opt.shiftwidth = 2                -- Indent by 2 spaces
vim.opt.softtabstop = 2               -- Soft tabs

-- SEARCH
vim.opt.ignorecase = true             -- Case-insensitive search...
vim.opt.smartcase = true              -- ...unless uppercase used
vim.opt.incsearch = true              -- Highlight as you type
vim.opt.hlsearch = true               -- Highlight matches

-- UI
vim.opt.cursorline = true             -- Highlight current line
vim.opt.signcolumn = "yes"            -- Always show sign column (for LSP/git)
vim.opt.showmode = false              -- Hide -- INSERT -- if using statusline
vim.opt.wrap = false                  -- No line wrap (better for code)

-- PERFORMANCE
vim.opt.updatetime = 250              -- Faster updates (useful for LSP)
vim.opt.swapfile = false              -- Don't use swap files
vim.opt.belloff = "all"               -- Disable all bells

-- COMPLETION
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest:full", "full" }

-- FILE IGNORE
vim.opt.wildignore = {
  "*.docx", "*.jpg", "*.png", "*.gif", "*.pdf",
  "*.pyc", "*.exe", "*.flv", "*.img", "*.xlsx"
}

