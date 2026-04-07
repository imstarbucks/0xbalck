return {
  { "knubie/vim-kitty-navigator", lazy = false },

  -- Emmet
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "scss", "less", "javascriptreact", "typescriptreact", "vue", "astro", "gotmpl", "gohtmltmpl" },
    init = function()
      vim.g.user_emmet_leader_key = "<C-e>"
    end,
  },

  -- Colorscheme
  -- {
  --     "ronisbr/nano-theme.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     config = function()
  --         vim.cmd.colorscheme("nano-theme")
  --         vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  --         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  --     end,
  -- },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local lackluster = require("lackluster")
      lackluster.setup({
        tweak_syntax = {
          comment = lackluster.color.gray5, -- or gray4
        },
        tweak_background = {
          normal = 'none',
          telescope = 'none',
          menu = lackluster.color.gray3,
          popup = 'default',
        },
      })

      vim.cmd.colorscheme("lackluster-hack")
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "auto" },
    },
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim", "nvim-telescope/telescope-media-files.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>",                desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",                 desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",                   desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",                 desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>",                  desc = "Recent files" },
      { "<leader>/",  "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Search in buffer" },
      { "<leader>fp", "<cmd>Telescope media_files<CR>",               desc = "Media files" },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
            find_cmd = "fd",
          },
        },
      })
      require("telescope").load_extension("media_files")
    end,
  },

  -- Telescope media preview plugin
  {
    "nvim-telescope/telescope-media-files.nvim"
  },

  -- File explorer (buffer-based)
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-",         "<cmd>Oil<CR>", desc = "Open parent directory" },
      { "<leader>t", "<cmd>Oil<CR>", desc = "Open file explorer" },
    },
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    },
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
      },
    },
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Mini.nvim modules
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      -- Icons (ASCII preset — no Nerd Font required)
      require("mini.icons").setup({ style = "ascii" })
      MiniIcons.mock_nvim_web_devicons()

      -- Comment toggling (gcc / gc in visual)
      require("mini.comment").setup()

      -- Surround (sa = add, sd = delete, sr = replace)
      require("mini.surround").setup()

      -- Enhanced text objects (around/inside function args, brackets, etc.)
      require("mini.ai").setup()

      -- Split/join arguments, arrays, objects (gS to toggle)
      require("mini.splitjoin").setup()

      -- Jump to any visible character pair
      require("mini.jump2d").setup()

      -- Move lines/selections with Alt+hjkl
      require("mini.move").setup()

      -- Session management
      require("mini.sessions").setup({
        autoread = false,
        autowrite = true,
        directory = vim.fn.stdpath("data") .. "/sessions",
      })
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
    opts = {},
  },

  -- Which-key (shows available keybindings)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    keys = {
      { "<leader>j", function() require("conform").format({ async = true }) end, desc = "Format file" },
    },
    opts = {
      default_format_opts = {
        lsp_format = "fallback"
      },
      format_on_save = function(bufnr)
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") then
          return
        end
        if vim.bo[bufnr].filetype == "go" then
          return { timeout_ms = 3000, lsp_format = "fallback" }
        end
      end,
      formatters_by_ft = {
        go = { "goimports", "gofmt", stop_after_first = true },
        gohtmltmpl = { "prettier" },
        javascript = { "biome", "prettier", stop_after_first = true },
        javascriptreact = { "biome", "prettier", stop_after_first = true },
        typescript = { "biome", "prettier", stop_after_first = true },
        typescriptreact = { "biome", "prettier", stop_after_first = true },
        vue = { "biome", "prettier", stop_after_first = true },
        astro = { "biome", "prettier", stop_after_first = true },
        html = { "prettier" },
        css = { "prettier" },
        json = { "biome", "prettier", stop_after_first = true },
        jsonc = { "biome", "prettier", stop_after_first = true },
        yaml = { "prettier" },
      },
      formatters = {
        biome = { require_cwd = true }
      }
    },
  },

  -- Diagnostics list
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / References (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                             desc = "Quickfix List (Trouble)" },
    },
  },
}
