return {
  -- Plugin manager
  { "nvim-lua/plenary.nvim" },
  --
  -- -- LSP
  -- { "neovim/nvim-lspconfig" },
  -- { "williamboman/mason.nvim",          build = ":MasonUpdate" },
  -- { "williamboman/mason-lspconfig.nvim" },

  -- Auto mkdir when missing
  { "jghauser/mkdir.nvim", },

  -- LackLuster Theme
  { "nvim-tree/nvim-web-devicons", opts = {} },

  -- -- friendly-snippets
  -- { "rafamadriz/friendly-snippets" },

  -- vim-go
  { "fatih/vim-go" },

  -- emmet-vim
  { "mattn/emmet-vim" },

  --indent
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      require("ibl").setup()
    end
  },

  -- Zig plugin
  {
    "ziglang/zig.vim"
  }
}
