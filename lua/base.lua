-- vim.cmd ('autocmd')

vim.scriptencoding='utf-8'
vim.opt.encoding='utf-8'
vim.opt.fileencoding='utf-8'

vim.wo.number=true

vim.opt.title=true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup=false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 2
vim.opt.shell = 'fish'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.wrap = false -- No wrap lines
-- vim.opt.backspace = 'smart,eol,indent'
vim.opt.path:append { '**' } -- Finding files -Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Cs = "\e[4:0m"]])
-- does not work on iTerm2.

--vim.api.nvim_create_autocmd("InsertLeave", {
--        pattern = '*'
--        command = "set nopaste"
--})

-- Add asterists in block comments
vim.opt.formatoptions:append {'r'}

