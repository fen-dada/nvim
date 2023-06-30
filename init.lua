require('base')
require('highlights')
require('maps')
require('plugins')
require('lsp')
require('keymaps')


local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

vim.g.neovide_transparency = 0.0
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#0f1117" .. alpha()
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0
vim.opt.linespace = 0
vim.g.neovide_scale_factor = 1.0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
