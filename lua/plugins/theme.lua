return {
  "slugbyte/lackluster.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    -- vim.cmd.colorscheme("lackluster")
    vim.cmd.colorscheme("lackluster-hack") -- my favorite
    -- vim.cmd.colorscheme("lackluster-mint")
  end,
  config = function()
    local lackluster = require("lackluster")
    lackluster.setup({
      color_icons = false,
      override = {
        ["default_icon"] = {
          color = lackluster.color.gray4,
          name = "Default",
        }
      }
    })
  end
}
