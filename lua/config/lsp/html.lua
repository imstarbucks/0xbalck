local M = {}

function M.setup()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  require("lspconfig").html.setup({
    capabilities = capabilities,
  })
end

return M
