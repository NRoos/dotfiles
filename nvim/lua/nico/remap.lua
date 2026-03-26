vim.keymap.set('n', '<C-n>', ':FzfLua files<CR>')
vim.keymap.set('n', '<C-b>', ':ClaudeCode<CR>')
vim.keymap.set('t', '<C-b>', ':ClaudeCode<CR>')

vim.keymap.set({ 'n', 'v' }, '<right>', '<Nop>')
vim.keymap.set({ 'n', 'v' }, '<left>', '<Nop>')
vim.keymap.set({ 'n', 'v' }, '<up>', '<Nop>')
vim.keymap.set({ 'n', 'v' }, '<down>', '<Nop>')

vim.keymap.set('n', '<leader>k', ':noh<CR>', { silent = true })

-- LSP keybinds

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }

    vim.keymap.set('n', '<C-p>', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, opts)

    -- https://www.mitchellhanberg.com/modern-format-on-save-in-neovim/
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = event.buf,
      callback = function()
        vim.lsp.buf.format { async = false, id = event.data.client_id }
      end

    })
  end,
})

--
