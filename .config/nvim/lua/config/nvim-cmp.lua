-- Setup nvim-cmp.
local cmp = require("cmp")

-- The extentions needed by nvim-cmp should be loaded beforehand
require("cmp_nvim_lsp")
require("cmp_path")
require("cmp_buffer")
-- require("cmp_omni")
-- require("cmp_nvim_ultisnips")

local function lsp_filter(type)
    return cmp.mapping.complete({
        config = {
            sources = {
                {
                    name = 'nvim_lsp',
                    entry_filter = function(entry)
                        return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] == type
                    end
                }
            }
        }
    })
end

cmp.setup {
  mapping = cmp.mapping.preset.insert {
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    -- ["<CR>"] = cmp.mapping.confirm { select = true },
    -- ["<C-e>"] = cmp.mapping.abort(),
    ["<Esc>"] = cmp.mapping.close(),
    -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ['<C-f>'] = lsp_filter("Field"),
    ['<C-v>'] = lsp_filter("Variable"),
    -- ['<C-m>'] = lsp_filter("Method"),
},

  sources = {
    { name = "nvim_lsp" },
    { name = "ultisnips" },
    { name = "path" },
    { name = "buffer", keyword_length = 3 },
  },

  completion = {
    keyword_length = 1,
    completeopt = "menu,noselect",
  },

  view = {
    entries = "custom",
  },

}

