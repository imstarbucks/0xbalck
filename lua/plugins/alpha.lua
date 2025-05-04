return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⣿⣿⣿⣿⣿⣿⣟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⣿⣿⣿⣿⣿⣿⣿⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⢿⣿⣿⣿⣿⣿⡟⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠀⠀⠨⠶⣦⣤⣄⣉⠁⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢫⣶⢟⣠⠶⣺⣿⣿⣿⣿⣿⣳⣦⣄⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣠⣟⣵⡿⣡⣾⣿⣿⣿⠉⣿⣿⣧⠛⢿⣿⣦⡘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣰⣿⣿⢏⣼⣿⣿⣿⣿⠏⡄⠃⣿⣿⡄⡊⠻⣿⣿⡄⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢰⣿⣿⡇⣼⣿⣿⢃⣿⠇⣰⣿⠀⣿⣿⢇⣿⣄⠹⣿⣷⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢸⣿⠻⢰⣿⣿⢃⣾⠋⣴⣏⡋⠀⣿⣿⠸⣛⣿⣧⢻⣿⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣏⠀⢺⡇⣃⠞⠁⠀⠀⢤⣙⢰⣿⡇⠈⠉⠉⡉⠁⠹⠃⢿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⠀⠈⠠⢀⣴⣧⣀⣤⣾⡏⣾⡟⣼⣦⣀⣀⣋⡤⠀⠀⢸⣿⡏⣾⠃⠛⣥⠈⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢇⣑⠺⠂⢸⣿⣿⣿⣿⡿⣰⡟⣴⣿⣿⣿⣿⣿⢇⠀⠠⠸⠛⠱⢋⣿⢸⢧⠔⢿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⡄⢠⡙⢦⠀⣼⣿⣿⣿⡿⠃⡉⠞⠛⠻⣿⣿⣿⡿⣸⠀⢰⡇⡀⣠⣿⠋⠞⣨⠶⡃⢻⣿⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣸⢡⡇⣿⡇⠀⢠⡜⢿⣿⣿⣥⣾⠀⠀⠀⠀⣿⣿⣿⠃⣿⠸⠴⡘⣿⣿⣿⡗⠘⡣⠴⠶⠎⠻⣿⣿⣿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⣿⡿⢫⠞⡡⢰⡇⡿⠁⡠⢸⣿⣿⣿⣿⣿⣿⣤⣶⣦⣴⣿⡟⣡⠂⣿⡄⠀⠃⣬⡻⠿⣷⣶⣾⣿⣟⠀⣶⠀⡙⢿⣿⣿ ]],
      [[ ⣿⣿⣿⣿⣿⣿⠏⠄⢁⣾⠁⡾⠀⠃⣄⡀⠈⣿⣿⣿⣿⣿⡛⠿⣿⣿⡿⠋⣾⡗⢀⣿⡇⣸⠀⣿⣿⡇⠈⠙⢿⣿⠋⢰⣿⠀⠅⡆⢈⠹ ]],
      [[ ⣿⣿⣿⣿⠟⠁⠀⣠⣿⣇⡀⢁⡃⠸⣿⣿⡇⣧⣝⡻⢿⣿⣿⣦⡀⣤⣀⣰⠟⠀⠚⠛⢁⣋⠀⠟⠻⣿⣦⠀⠀⠀⠀⠿⠟⠀⡄⢻⡄⠙ ]],
      [[ ⣿⣿⡿⠋⣴⢃⣾⣿⡿⢸⠁⣿⣿⣧⣹⣷⣷⢸⣿⣟⢳⣶⣭⣭⣅⠸⣿⢫⡄⣀⣀⣀⣉⠻⣿⣿⠱⡄⠁⠠⢤⡀⠀⠀⠀⢸⠁⠈⢿⣄ ]],
      [[ ⣿⡿⢁⣾⢡⣿⣿⣿⡇⡟⢸⣿⣿⣿⣷⣝⠿⠞⢿⣿⣧⡹⣿⡏⠈⠀⠀⡈⢷⡟⢿⣿⣿⣗⢈⠻⣧⢱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻ ]],
      [[ ⡿⠀⣾⡇⣿⣿⣿⣿⢱⡇⣾⣿⣮⡻⣿⣿⣿⣦⢀⡻⢿⣿⡎⡀⠀⠀⠀⠛⠈⢿⣿⣿⣿⢿⣦⡁⢻⠈⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⣼⠀⠛⠀⣿⣿⣿⣿⢸⡇⣿⣿⣿⣷⡝⣿⣿⣿⣇⠘⣶⣭⣼⣿⣷⣤⡀⠀⢀⣀⢻⣿⣿⣷⣝⢷⠀⠀⢀⠀⠈⢷⣤⡀⠀⠀⠁⠛⠻⠿ ]],
      [[ ⠣⣰⣦⣤⣭⣙⡛⠿⢸⣷⢸⣿⠿⣿⣿⡈⢿⣿⣿⣆⠘⣿⣿⣿⣿⣿⣿⣦⡀⠻⣷⡙⣿⣿⣿⣧⣅⡀⠀⠀⣰⠋⢸⡿⠀⣀⠀⠀⠑⠲ ]],
      [[ ⣾⠿⣿⣶⣶⣶⣶⣦⠈⣿⡆⠈⠉⠉⠛⠷⡌⣿⣿⣿⣦⡈⢿⣿⣿⣿⣿⣿⣧⡀⠈⣿⡜⢿⣿⣿⣿⣿⣦⡀⠁⠀⣾⠁⡼⠟⠁⠀⠀⠀ ]],
      [[ ⣿⣶⣦⣤⣀⣉⠙⠛⠷⠸⣿⡀⠀⠁⣴⣶⡄⠈⠻⠟⣫⣭⣀⣝⠻⣿⣿⣿⣿⣿⣆⠈⠙⠌⢿⣿⣿⣿⣿⣿⡄⠀⠁⠀⠀⠀⠀⠀⠀⠀ ]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰈞   Find file",
        ":lua require('lazy').load({ plugins = { 'telescope.nvim' } }); require('telescope.builtin').find_files()<CR>"),
      dashboard.button("r", "   Recent",
        ":lua require('lazy').load({ plugins = { 'telescope.nvim' } }); require('telescope.builtin').oldfiles()<CR>"),
      dashboard.button("q", "󰩈   Quit NVIM", ":qa<CR>"),
    }
    -- Set dashboard layout
    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.mappings,
      dashboard.section.footer,
    }

    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
  end,
}
