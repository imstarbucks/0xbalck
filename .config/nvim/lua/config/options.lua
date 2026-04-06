-- Prepend nvm node to PATH so Mason can find npm/node
-- Supports both fish nvm (~/.local/share/nvm) and bash nvm (~/.nvm/versions/node)
local nvm_data = vim.fn.expand("$HOME/.local/share/nvm")
if vim.fn.isdirectory(nvm_data) == 1 then
    local versions = vim.fn.glob(nvm_data .. "/v*", false, true)
    if #versions > 0 then
        table.sort(versions)
        local node_bin = versions[#versions] .. "/bin"
        if vim.fn.isdirectory(node_bin) == 1 then
            vim.env.PATH = node_bin .. ":" .. vim.env.PATH
        end
    end
else
    local nvm_dir = vim.fn.expand("$HOME/.nvm")
    local installed = vim.fn.glob(nvm_dir .. "/versions/node/v*", false, true)
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
