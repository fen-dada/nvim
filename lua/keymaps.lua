local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

function flash_jump()
    require('flash').jump()
end

keymap("n","<S-l>",":BufferLineCycleNext<cr>",opts)
keymap("n","<S-h>",":BufferLineCyclePrev<cr>",opts)
keymap("n","<F4>",":NvimTreeToggle<cr>",opts)
keymap("v","<","<gv",opts)
keymap("v",">",">gv",opts)
keymap("i","jk","<Esc>",opts)
keymap("n","<Space>",":",opts)

keymap("n","<S-f>",":Telescope find_files<cr>",opts)

keymap("v","<S-i>",":normal I--<cr>",opts)

keymap("n","s",":lua flash_jump()<cr>",opts)-- for flash.nvim leaderkey


keymap("n","<S-b>",":Telescope buffers<cr>",opts)

keymap("n","<C-[>",":BufferLineCloseLeft<cr>",opts)
keymap("n","<C-]>",":BufferLineCloseRight<cr>",opts)
--keymap("i","<C-j>","copilot#Accept("\<CR>")",opts)
keymap("v","<?-j>",":m  .+1<cr>==",opts)
keymap("v","<?-k>",":m  .-2<cr>==",opts)

-- keymap("n","<SSSS->",":BufferLineMoveNext",opts)
keymap("n","<S-t>",":NvimTreeFocus<cr>",opts)
