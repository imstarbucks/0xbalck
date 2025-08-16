return {
  'dense-analysis/ale',
  config = function()
    local g = vim.g

    -- Aliases for custom languages (ALE uses these for applying fixers)
    g.ale_fixers_aliases = {
      jsx = { 'javascript', 'css', 'javascriptreact' },
      tsx = { 'typescript', 'css', 'typescriptreact' },
    }

    -- Fixers configuration per filetype
    g.ale_fixers = {
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      vue = { 'biome' },
    }

    -- Linters configuration per filetype
    g.ale_linters = {
      vue = { 'vls' },
    }

    g.ale_linters_explicit = 1

    g.ale_javascript_prettier_use_local_config = 1
  end
}
