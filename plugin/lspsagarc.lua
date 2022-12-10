local ok, saga = pcall(require, 'lspsaga')
if not ok then
  vim.notify('ERROR: Lspsaga not loaded.')
  return
end

saga.init_lsp_saga({
  saga_winblend = 10,
})

-- Keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap('n', 'ga', '<Cmd>Lspsaga code_action<CR>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
keymap('n', '<leader>t', '<Cmd>Lspsaga open_floaterm<CR>', opts)
keymap('t', '<C-c>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
