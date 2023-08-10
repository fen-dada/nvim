local keymap = vim.keymap
-- Do not yank with x
keymap.set('n','x','"_x')

-- Increment/decrement
keymap.set('n','+','<C-a>')
keymap.set('n','-','<C-x>')

-- Delete a word backwards
keymap.set('n','dw','vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

--vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", 
    --command = "nnoremap <buffer> <C-c> :split<CR>:te g++ %:t:r.cpp -o %:t:r ./%:t:r<CR>i"})
keymap.set('n', 'R', ':RunCode<CR>', { noremap = true, silent = false })
--vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
--vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
--vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', 'q', ':RunClose<CR>', { noremap = true, silent = false })
--vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
--vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
