-- the opts function can also be used to change the default opts:
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- Tambahkan variabel untuk menyimpan penggunaan memori
    local meminfo = ""

    -- Fungsi untuk mendapatkan penggunaan memori
    local function get_meminfo()
      meminfo = vim.fn.system("free -m | awk '/^Mem/ {print $3}'"):gsub("\n", "") .. "MB"
    end

    -- Ambil memori pertama kali saat startup
    get_meminfo()

    -- Setiap 5 detik (5000ms), perbarui statusline
    vim.fn.timer_start(10000, function()
      get_meminfo() -- Update nilai memori
      vim.cmd("redrawstatus") -- Perbarui statusline
    end)
    table.insert(opts.sections.lualine_x, {
      function()
        return meminfo
      end,
    })
  end,
}
