return {
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  -- vim-go
  {
    "fatih/vim-go",
    ft = "go",
    build = ":GoInstallBinaries",
    config = function()
      -- Disable features handled by gopls to avoid conflicts
      vim.g.go_def_mapping_enabled = 0
      vim.g.go_gopls_enabled = 0
      vim.g.go_code_completion_enabled = 0
      vim.g.go_doc_keywordprg_enabled = 0
      vim.g.go_fmt_autosave = 0 -- conform handles formatting
    end,
  },

  -- Go lang template for tresitter
  { "ngynkvn/gotmpl.nvim", opts = {} },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()

      -- Apply blink.cmp capabilities to all servers
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -- Server-specific settings
      vim.lsp.config("gopls", {
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
            gofumpt = true,
            templateExtensions = { 'tmpl' },
          },
        },
      })

      vim.lsp.config("jsonls", {
        settings = {
          json = { validate = { enable = true } },
        },
      })

      vim.lsp.config("yamlls", {
        settings = {
          yaml = { schemaStore = { enable = true }, validate = true },
        },
      })
      -- vtsls with Vue support via @vue/typescript-plugin
      local vue_language_server_path = vim.fn.expand(
        "$MASON/packages/vue-language-server/node_modules/@vue/language-server")
      vim.lsp.config("vtsls", {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vue_language_server_path,
                  languages = { "vue" },
                  configNamespace = "typescript",
                },
              },
            },
          },
        },
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      })

      -- vue_ls handles CSS/HTML in .vue files (hybrid mode with vtsls for TS)
      vim.lsp.config("vue_ls", {
        init_options = {
          vue = { hybridMode = true },
        },
      })

      vim.lsp.config("emmet_language_server", {
        filetypes = {
          "html", "css", "scss", "less",
          "javascriptreact", "typescriptreact",
          "vue", "astro", "gotmpl", "gohtmltmpl",
        },
      })

      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "gopls",
          "jsonls",
          "yamlls",
          "vtsls",
          "html",
          "cssls",
          "tailwindcss",
          "astro",
          "vue_ls",
          "emmet_language_server",
        },
      })

      -- Go: organize imports (auto-import) on save via gopls
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          local client = vim.lsp.get_clients({ bufnr = 0, name = "gopls" })[1]
          if not client then return end
          local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
          params.context = { only = { "source.organizeImports" } }
          local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
          for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
              if r.edit then
                local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                vim.lsp.util.apply_workspace_edit(r.edit, enc)
              end
            end
          end
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- Go: populate boilerplate for new files
      vim.api.nvim_create_autocmd("BufNewFile", {
        pattern = "*.go",
        callback = function()
          local dir = vim.fn.expand("%:p:h:t")
          local lines = { "package " .. dir, "", "" }
          -- Add main func for files named main.go or in a main package dir
          local fname = vim.fn.expand("%:t")
          if fname == "main.go" then
            vim.list_extend(lines, { "func main() {", "\t", "}" })
          end
          vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
          -- Place cursor on the empty line
          local target = fname == "main.go" and 5 or 3
          vim.api.nvim_win_set_cursor(0, { target, 0 })
        end,
      })

      -- Keymaps on LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gr", vim.lsp.buf.references, "Go to references")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
          map("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format document")
        end,
      })
    end,
  },

}
