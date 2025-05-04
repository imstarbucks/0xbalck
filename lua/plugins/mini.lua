return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.surround').setup()
    require('mini.comment').setup()
    require('mini.pairs').setup()
    require('mini.icons').setup()
    require('mini.snippets').setup({
      snippets = {
        -- Auto-load based on runtime path
        require('mini.snippets').gen_loader.from_lang(),
      },
    })
    require('mini.completion').setup({
      mappings = {
        force_twostep = '<C-Space>',
        force_fallback = '<C-x>',
      }
    })
    require("mini.git").setup()
  end
}
