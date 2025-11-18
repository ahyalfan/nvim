-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope
--local telescope_utils = require("utils.telescope_utils")

--vim.api.nvim_set_keymap(
--  "n",
--  "<leader>fG",
--  ':lua require("utils.telescope_utils").live_grep_git_root()<CR>',
--  { noremap = true, silent = true }
--)

vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>fa", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- Keybinding untuk memformat JSON dengan jq
-- vim.api.nvim_set_keymap("n", "<leader>j", ":%!jq .<CR>", { noremap = true, silent = true })

local map = vim.keymap.set

map("c", "<C-v>", "<C-R>+", { noremap = true })
-- Hapus baris tanpa ganggu register
map("n", "dd", '"_dd', { desc = "Delete line without overwriting register" })
-- Hapus kata tanpa ganggu register
map("n", "dw", '"_dw', { desc = "Delete word without overwriting register" })
-- Hapus visual selection tanpa overwrite
map("v", "d", '"_d', { desc = "Visual delete without overwriting register" })

map("n", "<leader>j", ":%!jq .<CR>", { desc = "json formatter", noremap = true, silent = true })

-- silent
-- Pemetaan tanpa silent: menampilkan pesan di command line
-- Pemetaan dengan silent: tidak menampilkan pesan di command line

map("n", "<C-p>", ":FloatermToggle<CR>", { desc = "floating terminal", silent = true })
map("n", "<C-t>", ":Typr<CR>", { desc = "typing race", silent = true })
