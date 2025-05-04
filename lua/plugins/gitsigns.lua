return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    local signs = {
      add          = { text = '+' },
      change       = { text = '~' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    }

    gitsigns.setup({
      signs = signs,
      signs_staged = signs,
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      preview_config = {
        -- Options passed to nvim_open_win
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
    })

  end,
  on_attach = function()
    local gitsigns = require("gitsigns")
    -- Toggles
    vim.keymap('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    vim.keymap('n', '<leader>tw', gitsigns.toggle_word_diff)
    vim.keymap('n', '<leader>hi', gitsigns.preview_hunk_inline)
  end
}
