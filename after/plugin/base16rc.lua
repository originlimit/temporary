local ok, base16 = pcall(require, 'base16-colorscheme')
if not ok then
  vim.notify('ERROR: Base16 not loaded.')
  return
end

base16.setup({
  base00 = '#00000000', base01 = '#131319', base02 = '#1c1c26', base03 = '#6c7891',
  base04 = '#696969', base05 = '#c5c8e6', base06 = '#9a9bb3', base07 = '#c5c8e6',
  base08 = '#8f53b9', base09 = '#cf463f', base0A = '#6963f0', base0B = '#99aaff',
  base0C = '#999900', base0D = '#6963f0', base0E = '#37a2a0', base0F = '#e3a3f2',
})

-- Colors I'm using to test stuff:
-- #3333ff #2e2eb8 #99aaff #49439f #37a201 #79241f #770000 #9a9bb3 #abb2bf #cf463f #37b291
-- Leaving base00 as #00000000 just makes it use the default background color
-- yogurt #e3a3f2 #37a2a0 #8f53b9
