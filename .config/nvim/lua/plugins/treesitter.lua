return {
    {
        "wavded/vim-stylus",
        ft = "stylus",
    },

    {
        "wuelnerdotexe/vim-astro",
        ft = "astro",
        init = function()
            vim.g.astro_typescript = "enable"
            vim.g.astro_stylus = "disable"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({})

            -- Install parsers
            require("nvim-treesitter").install({
                "astro", "bash", "c", "css", "go", "html", "javascript",
                "json", "lua", "markdown", "python", "rust",
                "tsx", "typescript", "vim", "vimdoc", "vue", "yaml",
            })

            -- Enable treesitter highlighting for all supported filetypes
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end,
    },
}
