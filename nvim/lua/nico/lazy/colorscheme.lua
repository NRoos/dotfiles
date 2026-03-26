return {
  "marko-cerovac/material.nvim",
  config = function()
    vim.g.material_style = "palenight"
    require("material").setup({
      lualine_style = "default",
      disable = {
        background = true,
      }
      -- your configuration comes here
      -- or leave it empty to use the default settings
    })
  end
}
