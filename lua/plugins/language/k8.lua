-- ~/.config/nvim/lua/plugins/kube-utils.lua
return {
  {
    "h4ckm1n-dev/kube-utils-nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = true,
    event = "VeryLazy",
  },
}
-- lazy = true: Menandakan bahwa plugin ini tidak akan dimuat secara otomatis saat Vim/Neovim dimulai.
-- Sebaliknya, plugin akan dimuat ketika dipicu oleh suatu kondisi tertentu, seperti perintah atau event.
--
-- event = "VeryLazy": Ini menentukan bahwa plugin akan dimuat ketika terjadi event dengan nama VeryLazy.
-- VeryLazy biasanya mengacu pada pemicu yang sangat terlambat, artinya plugin ini
-- hanya akan dimuat setelah beberapa hal lain diinisialisasi terlebih dahulu,
-- untuk menghindari menambah waktu startup.
