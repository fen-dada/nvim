local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n","<S-l>",":BufferLineCycleNext<cr>",opts)
keymap("n","<S-h>",":BufferLineCyclePrev<cr>",opts)
keymap("n","<C-l>",":NvimTreeToggle<cr>",opts)
keymap("v","<","<gv",opts)
keymap("v",">",">gv",opts)

keymap("v","<?-j>",":m  .+1<cr>==",opts)
keymap("v","<?-k>",":m  .-2<cr>==",opts)
