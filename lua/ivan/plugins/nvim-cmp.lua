return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
      cmp.select_next_item() -- Navigate to the next item in the suggestion list
    else
      fallback() -- If no completion menu is visible, fall back to regular tab
    end
  end, { "i", "s" }), -- Support insert and select mode

  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item() -- Navigate to the previous item in the suggestion list
    else
      fallback() -- If no completion menu is visible, fall back to regular Shift-Tab
    end
  end, { "i", "s" }),

  ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm completion with Enter
  ["<C-e>"] = cmp.mapping.abort(), -- Close completion menu with Ctrl+e
  ["<C-Space>"] = cmp.mapping.complete(), -- Manually trigger completion menu with Ctrl+Space
  ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
  ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll docs down
}),


      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
