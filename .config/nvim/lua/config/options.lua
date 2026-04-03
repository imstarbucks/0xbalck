-- Prepend nvm default node to PATH so Mason can find npm/node
local nvm_dir = vim.fn.expand("$HOME/.nvm")
local nvm_default = nvm_dir .. "/alias/default"
if vim.fn.filereadable(nvm_default) == 1 then
    local version = vim.fn.trim(vim.fn.readfile(nvm_default)[1])
    -- Resolve alias like "22" or "lts/jod" to actual installed version
    local alias_path = nvm_dir .. "/alias/" .. version
    while vim.fn.filereadable(alias_path) == 1 do
        version = vim.fn.trim(vim.fn.readfile(alias_path)[1])
        alias_path = nvm_dir .. "/alias/" .. version
    end
    -- Find matching installed version
    local versions_dir = nvm_dir .. "/versions/node"
    local installed = vim.fn.glob(versions_dir .. "/v" .. version .. "*", false, true)
    if #installed > 0 then
        table.sort(installed)
        local node_bin = installed[#installed] .. "/bin"
        if vim.fn.isdirectory(node_bin) == 1 then
            vim.env.PATH = node_bin .. ":" .. vim.env.PATH
        end
    end
end

-- Prepend Go bin to PATH so conform/tools can find Go binaries
local gobin = vim.fn.expand("$HOME/go/bin")
if vim.fn.isdirectory(gobin) == 1 then
    vim.env.PATH = gobin .. ":" .. vim.env.PATH
end

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.background = "dark"

-- Splits
opt.splitright = true
opt.splitbelow = true

-- System clipboard: only via <C-c> mapping, not default yank
-- opt.clipboard = "unnamedplus"

-- Undo persistence
opt.undofile = true
opt.swapfile = false

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
opt.completeopt = "menuone,noselect"

-- Whitespace characters (toggle with <leader>w)
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({ timeout = 200 })
    end,
})

-- Show diagnostics inline as virtual text
vim.diagnostic.config({
    virtual_text = true,
    float = { border = "rounded", source = true },
})
