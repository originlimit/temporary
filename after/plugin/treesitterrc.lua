local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  vim.notify('ERROR: Treesitter not loaded.')
  return
end

treesitter.setup {
  ensure_installed = {
    'haskell',
    'lua',
    'rust',
    'javascript',
    'typescript'
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  }
}

