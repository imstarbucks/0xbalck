return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", "javascript", "html",
        "typescript", "vue", "php", "go", "python", "css" -- Added CSS
      },
      sync_install = false,                                        -- install parsers asynchronously
      highlight = {
        enable = true,                                             -- enable syntax highlighting
      },
      indent = {
        enable = true, -- enable Treesitter-based indentation
      },
      incremental_selection = {
        enable = true,                 -- enable incremental selection
        keymaps = {
          init_selection = "<CR>",     -- keymap to start selection
          node_incremental = "<C-n>",  -- increment the selection for the node
          scope_incremental = "<C-s>", -- increment the selection for scope
          node_decremental = "<C-p>",  -- decrement the selection for the node
        },
      },
      textobjects = {
        enable = true,                -- enable text objects
        keymaps = {
          ["af"] = "@function.outer", -- select entire function
          ["if"] = "@function.inner", -- select inner function
          ["ac"] = "@class.outer",    -- select entire class
          ["ic"] = "@class.inner",    -- select inner class
        },
      },
    })
  end
}

