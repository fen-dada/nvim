return require('packer').startup(function(use)


  -- Packer can manage itself

  use 'wbthomason/packer.nvim'
 -- use { "zbirenbaum/copilot.lua" }
  -- using packer.nvim
use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons',config = function() require("bufferline").setup{} end}  
  -- Color Scheme
  use 'rebelot/kanagawa.nvim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim','nvim-lua/popup.nvim'} }
}

   -- use {'akinsho/toggleterm.nvim',tag = "v2.*" }
   use {'akinsho/toggleterm.nvim', tag = 'v2.*',require=function()
    require("toggleterm").setup({
        open_mapping = [[<c-\>]],

        start_in_insert=true,

        direction = 'float',

        size=20
    })end
   }
       
-- install without yarn or npm
    use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
}

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

   use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',config = function() require('nvim-treesitter.configs').setup{} end}
 use {'CRAG666/code_runner.nvim',config = function()
 require('code_runner').setup({
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = "python3 -u",
    typescript = "deno run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
  },
})
end} --use 'mfussenegger/nvim-dap'
    
  use {'windwp/windline.nvim',config = function() require('wlsample.airline')
--  the animated alternative. you can toggle animation by press `<leader>u9`
  require('wlsample.airline_anim')
end}

-- auto pairs
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}


  use 'hrsh7th/nvim-cmp'
  -- Unless you are still migrating, remove the deprecated commands from v1.x
--vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
--
  --use {'hrsh7th/nvim-cmp',config  = function()
      --local cmp=require('cmp')
      --require('nvim-cmp').setup({
    --snippet = {
      ---- REQUIRED - you must specify a snippet engine
      --expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        --require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        --require('snippy').expand_snippet(args.body) -- For `snippy` users.
        ---- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      --end,
    --},
    --window = {
       --completion = cmp.config.window.bordered(),
       --documentation = cmp.config.window.bordered(),
    --},
    --mapping = cmp.mapping.preset.insert({
      --['<C-b>'] = cmp.mapping.scroll_docs(-4),
      --['<C-f>'] = cmp.mapping.scroll_docs(4),
      --['<C-Space>'] = cmp.mapping.complete(),
      --['<C-e>'] = cmp.mapping.abort(),
      --['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --}),
    --sources = cmp.config.sources({
      --{ name = 'nvim_lsp' },
      --{ name = 'vsnip' }, -- For vsnip users.
       --{ name = 'luasnip' }, -- For luasnip users.
      ---- { name = 'ultisnips' }, -- For ultisnips users.
       --{ name = 'snippy' }, -- For snippy users.
    --}, {
      --{ name = 'buffer' },
    --})
  --})
  --end} -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin`
  -- Default options:
 vim.cmd("colorscheme kanagawa")
require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true},
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = true,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    terminalColors = true,      -- define vim.g.terminal_color_{0,17}
    colors = {},
    --overrides = {},
    theme = "default"           -- Load "default" theme or the experimental "light" theme
})

use {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require('copilot').setup({
      panel = {
        enabled = false,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>"
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = false,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 16.x
      server_opts_overrides = {},
    })
  end,
}
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
  config = function()
    require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}) 
  end

}
use "MunifTanjim/nui.nvim"
use "rcarriga/nvim-notify"
use{'folke/noice.nvim',config = function() require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
}) end}

use 'folke/flash.nvim' 
-- Lua
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
end)


