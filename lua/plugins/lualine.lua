return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',
        section_separators = '',
        component_separators = '',
        icons_enabled = false,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = {{
          'filename',
          path = 1,
        }},
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'filetype', 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    })
  end
}
