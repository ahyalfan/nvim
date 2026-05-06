-- issue
--
-- jadi untuk sementara sampai di fix // mei 2025 // closed issue sept 2025
-- https://github.com/LazyVim/LazyVim/issues/6039
-- return {
--   { "mason-org/mason.nvim", version = "1.11.0" },
--   { "mason-org/mason-lspconfig.nvim", version = "1.32.0" },
-- }
--
-- jadi untuk sementara sampai di fix // 30 aprl 2026
-- (refactoring) https://github.com/LazyVim/LazyVim/issues/7122 and https://github.com/LazyVim/LazyVim/issues/7122
-- return {
--   { "lewis6991/async.nvim", lazy = true },
--   {
--     "ThePrimeagen/refactoring.nvim",
--     event = { "BufReadPre", "BufNewFile" },
--     dependencies = { "lewis6991/async.nvim" },
--     opts = {},
--   },
--   { import = "lazyvim.plugins.extras.editor.refactoring", enabled = false }, // disable refactoring terlebih dahulu
-- }

return {
  -- { "mason-org/mason.nvim", version = "^1.0.0" },
  -- { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },

  -- { "lewis6991/async.nvim", lazy = true },
  -- {
  --   "ThePrimeagen/refactoring.nvim",
  --   dependencies = {
  --     "lewis6991/async.nvim",
  --   },
  -- },
  --
}
