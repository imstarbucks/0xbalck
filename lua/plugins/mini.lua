return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.ai').setup()
    require('mini.surround').setup()
    require('mini.comment').setup()
    require('mini.pairs').setup()
    require('mini.icons').setup({
      style = 'ascii'
    })
    -- require('mini.completion').setup()
    -- require('mini.snippets').setup({
    --   snippets = {
    --     require('mini.snippets').gen_loader.from_file('~/.config/nvim/snippets/global.json'),
    --
    --     -- Auto-load based on runtime path
    --     require('mini.snippets').gen_loader.from_lang(),
    --   },
    -- })
    require("mini.notify").setup()
    require("mini.git").setup()
    require('mini.jump').setup()
    require('mini.hipatterns').setup({
      config = function()
        local hipatterns = require('mini.hipatterns')
        hipatterns.setup({
          highlighters = {
            -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
            fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
            hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
            todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
            note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

            -- Highlight hex color strings (`#rrggbb`) using that color
            hex_color = hipatterns.gen_highlighter.hex_color(),
          },
        })
      end
    })
  end
}
