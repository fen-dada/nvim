  --use 'hrsh6th/nvim-cmp' -- Autocompletion plugin
  --
  --use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  --use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  --use 'L3MON4D3/LuaSnip' -- Snippets plugin
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pyright',"sumneko_lua"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
     --on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end
-- luasnip setup
local luasnip = require 'luasnip'

local cmp = require'cmp'
local border_opts = {
    border = "single",
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,Cursor:Visual,Search:None",
}
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        --luasnip.lsp_expand(args.body)
         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
         --require('snippy').expand_snippet(args.body) -- For `snippy` users.
    --vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
       --ultisnips.lsp_expand(args.body)
      end,
    },
    window = {
       completion = cmp.config.window.bordered(border_opts),
       documentation = cmp.config.window.bordered(border_opts),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
       { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      --
       { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
      {name = 'nvim_lua'},
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  --cmp.setup.cmdline({ '/', '?' }, {
    --mapping = cmp.mapping.preset.cmdline(),
    --sources = {
      --{ name = 'buffer' }
    --}
  --})
--
require('cmp_nvim_lsp').setup({})
  ---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  --cmp.setup.cmdline(':', {
    --mapping = cmp.mapping.preset.cmdline(),
    --sources = cmp.config.sources({
      --{ name = 'path' }
    --}, {
      --{ name = 'cmdline' }
    --})
  --})
--
  -- Set up lspconfig.

  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
  }

