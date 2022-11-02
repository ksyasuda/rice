-- Setup nvim-cmp.
local cmp = require 'cmp'
local lspkind = require('lspkind')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
-- luasnip setup
local luasnip = require 'luasnip'
local highlight = require('cmp.utils.highlight')

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

lspkind.init({
  symbol_map = {
    Copilot = "",
  },
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})

cmp.setup({
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    capabilities = capabilities,
    mapping = {
        ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        -- if cmp.visible() then
        --     cmp.select_next_item()
        -- elseif luasnip.expand_or_jumpable() then
        --     luasnip.expand_or_jump()
        -- else
        --     fallback()
        -- end
       -- end, { "i", "s" }),
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end),
        ['<S-Tab>'] = cmp.mapping(function()
         if cmp.visible() then
           cmp.select_prev_item()
         end
       end, { "i", "s"}),
    },
    window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          col_offset = -3,
          side_padding = 0,
          border = "rounded",
          borderchars = {
            "─",
            "│",
            "─",
            "│",
            "╭",
            "╮",
            "╯",
            "╰",
          },
        },
        documentation = {
          border = "rounded",
          borderchars = {
            "─",
            "│",
            "─",
            "│",
            "╭",
            "╮",
            "╯",
            "╰",
          },
          -- padding = 15,
        }
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 75 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. strings[1] .. " "
          kind.menu = "    (" .. strings[2] .. ")"

          return kind
        end,
        -- format = lspkind.cmp_format({
        --     mode = 'symbol_text', -- show only symbol annotations
        --     menu = ({
        --       buffer = "[Buffer]",
        --       nvim_lsp = "[LSP]",
        --       luasnip = "[LuaSnip]",
        --       nvim_lua = "[Lua]",
        --       latex_symbols = "[Latex]",
        --     })
        -- })
    },
    sources = cmp.config.sources({
        { name = "copilot", group_index = 2 },
        { name = 'nvim_lsp', group_index = 2 },
        { name = 'nvim_lsp_signature_help', group_index = 2 },
        { name = "path", group_index = 2 },
        { name = 'luasnip', group_index = 2 }, -- For luasnip users.
        {
          name = 'buffer',
          option = {
              get_bufnrs = function()
                  local bufs = {}
                  for _, win in ipairs(vim.api.nvim_list_wins()) do
                    bufs[vim.api.nvim_win_get_buf(win)] = true
                  end
                  return vim.tbl_keys(bufs)
              end
          }
        }
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    }),
    sorting = {
        priority_weight = 2,
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    }
})


local servers = { 'bashls', 'jedi_language_server', 'sqlls', 'jsonls', 'yamlls', 'vimls', 'dotls', 'dockerls' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
    }
end


cmp.event:on("menu_opened", function()
  vim.b.copilot_suggestion_hidden = true
end)
cmp.event:on("menu_closed", function()
  vim.b.copilot_suggestion_hidden = false
end)
