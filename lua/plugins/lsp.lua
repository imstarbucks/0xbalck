return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = true
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Typescript Server
      lspconfig.ts_ls.setup({})
      lspconfig.eslint.setup({})

      -- HTML Server
      require("config.lsp.html").setup()

      -- Emmet Server
      lspconfig.emmet_ls.setup({})

      -- CSS Server
      require("config.lsp.css").setup()

      -- Tailwindcss
      lspconfig.tailwindcss.setup({})

      -- Lua language server for Neovim development
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })
    end
  }
}
