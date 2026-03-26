-- Adapted from a combo of
-- https://lsp-zero.netlify.app/v3.x/blog/theprimeagens-config-from-2022.html
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "j-hui/fidget.nvim",
  },
  config = function()
    require("fidget").setup({})

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    })

    vim.lsp.enable({
      'gopls',
      'lua_ls',
      'yamlls',
      'ts_ls',
      'marksman',
      'ruff',
      'eslint',
    })

    vim.diagnostic.config({
      virtual_text = true,
    })

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or 'single'

      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    local cmp = require('cmp')

    cmp.setup({
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
      },
      mapping = cmp.mapping.preset.insert({
        -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- ['<C-Space>'] = cmp.mapping.complete(),
      }),
    })
  end
}
