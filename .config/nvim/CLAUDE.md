# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using lazy.nvim as the plugin manager. Leader key is `<Space>`.

## Structure

- `init.lua` — Entry point; loads options, keymaps, then lazy.nvim (in that order)
- `lua/config/options.lua` — Editor options, PATH setup (nvm node, Go bin), diagnostics config
- `lua/config/keymaps.lua` — Global keybindings (set before plugins load)
- `lua/config/lazy.lua` — Bootstraps lazy.nvim, auto-discovers plugin specs from `lua/plugins/`
- `lua/plugins/` — One file per plugin group, each returns a table of lazy.nvim plugin specs:
  - `editor.lua` — Theme (lackluster), statusline (lualine), telescope, oil file explorer, gitsigns, mini.nvim modules, conform formatting, trouble diagnostics, autopairs, indent guides, which-key
  - `lsp.lua` — blink.cmp completion, vim-go, Mason + nvim-lspconfig with server configs (gopls, vtsls, vue_ls, jsonls, yamlls, html, cssls, tailwindcss, astro)
  - `treesitter.lua` — Treesitter setup, Astro/Stylus filetype support

## Key Design Decisions

- **Clipboard**: System clipboard is NOT default; only `<C-c>` in visual mode copies to system clipboard
- **Formatting**: conform.nvim handles formatting with format-on-save only for Go files; other languages use `<leader>j` for manual format. Biome is preferred over Prettier (falls back to Prettier when no biome config)
- **LSP completion**: Uses blink.cmp (not nvim-cmp); capabilities are applied globally via `vim.lsp.config("*")`
- **Vue**: Hybrid mode — vtsls handles TS (with @vue/typescript-plugin) and vue_ls handles CSS/HTML
- **Go**: vim-go is installed but most features are disabled in favor of gopls; auto-imports on save via code actions
- **File explorer**: oil.nvim (buffer-based), opened with `-` or `<leader>t`
- **Icons**: mini.icons with ASCII preset (no Nerd Font required), mocking nvim-web-devicons
