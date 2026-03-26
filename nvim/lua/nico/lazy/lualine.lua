return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'marko-cerovac/material.nvim',
  },
  config = function()
    local custom_material_nvim = require('lualine.themes.material-nvim')
    local material_colors = require('material.colors')
    custom_material_nvim.inactive.a.bg = material_colors.editor.bg_alt

    require("lualine").setup({
      options = {
        theme = custom_material_nvim,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      }
    })
  end
}
