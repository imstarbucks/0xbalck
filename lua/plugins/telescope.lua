return {
  'nvim-telescope/telescope.nvim',
  tag = "0.1.8",
  dependencies = { 'nvim-lua/plenary.nvim', 'desdic/telescope-rooter.nvim' },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      defaults = {
        theme = "dropdown"
      },
      extensions = {
        rooter = {
          patterns = { ".git", "lua", "Makefile", "package.json" }, -- You can customize this
        }
      },
    })
    telescope.load_extension('rooter')
  end,
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Live Grep" },
    { "<leader>l",  function() require("telescope.builtin").buffers() end,    desc = "List Buffers" },
  }
}
