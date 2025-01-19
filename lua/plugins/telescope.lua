-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  "nvim-telescope/telescope.nvim",

  opts = {
    defaults = {
      find_files = {
        hidden = true, -- Menampilkan file tersembunyi dalam pencarian
        follow = true, -- Ikuti symlink jika ada
        no_ignore = false, -- Pastikan file yang diabaikan oleh `.gitignore` tetap dicari
      },
    },
  },

  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false },
    -- change a keymap

    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
  },
}
