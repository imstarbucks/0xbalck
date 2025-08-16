local M = {}

function M.toggle_opacity()
  if vim.g.neovide_transparency == nil then
    vim.g.neovide_transparency = 1.0
  end

  if vim.g.neovide_transparency < 1.0 then
    vim.g.neovide_transparency = 1.0
    print("Opacity: 100%")
  else
    vim.g.neovide_transparency = 0.8
    print("Opacity: 80%")
  end
end

return M
