require('base')
require('highlights')
require('maps')
require('plugins')
require('lsp')
require('code_runner').setup({
  -- put here the commands by filetype
  filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python -u",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
	},
})
local opt = require("toggleterm").setup({
    open_mapping = [[<c-\>]],

    start_in_insert=true,

    direction = 'float',

    size=20
})
--local opt = require('toggleterm').setup({})


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

