return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    {
      "L3MON4D3/LuaSnip",
      build = "make install_jsregexp"
    },
    { "rafamadriz/friendly-snippets" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" }
  },
  config = function()
    -- lazy load snippets from vscode source via rafamadriz/friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    -- snippet extensions
    require 'luasnip'.filetype_extend("ruby", { "rails" })

    -- nvim-cmp setup
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = "path" },
        { name = "buffer" },
      },
      window = {
        documentation = cmp.config.window.bordered()
      },
      formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = 'λ',
            luasnip = '⋗',
          }

          item.menu = menu_icon[entry.source.name]
          return item
        end
      },
    }
  end
}
