-- kita juag bisa kasih dua plugin dalam 1 file dengan ememisahkanya {}
return {
  {
    --https://github.com/tpope/vim-fugitive
    "tpope/vim-fugitive",
    --plugin yang memuat commad git ada semua dan di persingkan, bisa baca dokumentasinya
    --sering sering baca dokumentasi aja biar lengkap
    --untuk menambabhkan- mengurangi git ke staging bisa dengan mudah
    --pertama :Git nanti akan muncul window baru
    --arahkan cursor ke nama file yng ingin ti tambhkan kemudian tekan < a >
    --jika ingin megurangin tekan < - >
    --
    --cara manual bisa juga
    --menambahkan ke stagin dengan Gwrite {path} atau Gwg {path} -> contoh Gwrite config/plugin/...
    --kalau mengurangi dari staging Greset {path}
    --
    --kalau mau mengurangi bisa :Greset ..
    --intinya banay documentasinya lebih lengkapnya
  },
  {
    -- "https://github.com/lewis6991/gitsigns.nvim",
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup() --ini jika ingin config default
      -- jika ingin config sendiri juga bisa
      -- bisa baca documentasinya di githubnya kita juga bisa kasih keymaps langsung dari sini
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end,
  },
}
-- jika tidak tahu info tentang pluginya bisa
-- :help nama-plugin
-- contoh :help fugitive
