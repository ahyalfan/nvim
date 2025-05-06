-- https://github.com/hrsh7th/cmp-emoji
--
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
}
--

-- return {
--   "hrsh7th/cmp-emoji",
--   config = function()
--     local cmp = require("cmp")
--     cmp.setup({
--       sources = cmp.config.sources({
--         { name = "emoji" },
--         -- sumber lain seperti nvim_lsp, luasnip, buffer, dll
--       }),
--     })
--   end,
-- }
