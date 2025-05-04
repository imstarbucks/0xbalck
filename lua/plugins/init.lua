return {
  -- Plugin manager
  { "nvim-lua/plenary.nvim" },

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim",          build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Auto mkdir when missing
  { "jghauser/mkdir.nvim", },

  -- LackLuster Theme
  { "nvim-tree/nvim-web-devicons",      opts = {} },

  -- friendly-snippets
  { "rafamadriz/friendly-snippets" },

  -- GitSigns
  { "lewis6991/gitsigns.nvim" },
}
