-- kita nonaktifkan dahulu karena masih belum butuh
return {

  -- "mg979/vim-visual-multi",
}

-- ### 2. Menggunakan Banyak Kursor
--
-- Setelah plugin terinstal, kamu bisa menggunakan banyak kursor dengan beberapa perintah berikut:
--
-- - **Ctrl + n** untuk menambahkan kursor pada kata yang sedang disorot.
-- - **Ctrl + p** untuk berpindah ke kursor sebelumnya.
-- - **Ctrl + x** untuk menghapus kursor saat ini.
-- - **Ctrl + d** untuk menghapus semua kursor.
-- - Gunakan **m** untuk memilih kata-kata lain yang sama dan menambahkannya ke kursor.
--
-- Kamu juga bisa memanfaatkan perintah visual dan mencari teks untuk menambahkan kursor pada setiap kemunculan teks tertentu.
--
-- ### 3. Kustomisasi (Optional)
--
-- Jika kamu ingin menyesuaikan keybindings atau perilaku plugin ini lebih lanjut, kamu bisa menambahkannya dalam konfigurasi LazyVim di file `~/.config/nvim/lua/plugins.lua` atau `~/.config/nvim/lua/lazyvim/settings.lua`.
--
-- Misalnya:
--
-- ```lua
-- vim.g.VM_maps = {
--   ['Find Under'] = '<C-n>',  -- Mapping untuk menambah kursor pada kata yang ditemukan
--   ['Find All'] = '<C-a>',   -- Mapping untuk memilih semua kursor yang cocok
-- }
-- ```
