-- -- the opts function can also be used to change the default opts:
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- Tambahkan variabel untuk menyimpan penggunaan memori
    local meminfo = ""
    local cpuinfo = ""

    -- Fungsi untuk mendapatkan penggunaan memori
    local function get_meminfo()
      meminfo = vim.fn.system("free -m | awk '/^Mem/ {print $3}'"):gsub("\n", "") .. "MB"
    end

    local function get_cpuinfo()
      -- Mengambil informasi penggunaan CPU dengan perintah 'top'
      -- untuk menghitung persentase penggunaan CPU dengan mengurangi idle dari 100
      cpuinfo = vim.fn.system("top -bn1 | grep 'Cpu(s)' | awk -F'[,id]*' '{print 100 - $4}'"):gsub("\n", "")
    end

    -- Ambil memori pertama kali saat startup
    get_meminfo()
    get_cpuinfo()

    -- Setiap 15 detik (15000ms), perbarui statusline
    vim.fn.timer_start(5000, function()
      vim.schedule(function() -- Pastikan pembaruan dilakukan pada thread aman
        get_meminfo() -- Update nilai memori
        get_cpuinfo() -- Update nilai cpu
        vim.cmd("redrawstatus") -- Perbarui statusline
      end)
    end, { ["repeat"] = -1 })

    table.insert(opts.sections.lualine_x, {
      function()
        return string.format("Mem: %s | CPU: %s⚡", meminfo, cpuinfo)
      end,
      -- color = { fg = "#82aaff", bg = "#292d3e" }, -- Warna teks dan background
      -- padding = { left = 1, right = 1 },
    })
  end,
}

-- lazy config
-- return {
--   "nvim-lualine/lualine.nvim",
--   event = "VeryLazy",
--   init = function()
--     vim.g.lualine_laststatus = vim.o.laststatus
--     if vim.fn.argc(-1) > 0 then
--       -- set an empty statusline till lualine loads
--       vim.o.statusline = " "
--     else
--       -- hide the statusline on the starter page
--       vim.o.laststatus = 0
--     end
--   end,
--   opts = function()
--     -- menambahkan memory
--     -- Tambahkan variabel untuk menyimpan penggunaan memori
--     local meminfo = ""
--     local cpuinfo = ""
--
--     -- Fungsi untuk mendapatkan penggunaan memori
--     local function get_meminfo()
--       meminfo = vim.fn.system("free -m | awk '/^Mem/ {print $3}'"):gsub("\n", "") .. "MB"
--     end
--
--     local function get_cpuinfo()
--       -- Mengambil informasi penggunaan CPU dengan perintah 'top'
--       -- untuk menghitung persentase penggunaan CPU dengan mengurangi idle dari 100
--       cpuinfo = vim.fn.system("top -bn1 | grep 'Cpu(s)' | awk -F'[,id]*' '{print 100 - $4}'"):gsub("\n", "")
--     end
--
--     -- Ambil memori pertama kali saat startup
--     get_meminfo()
--     get_cpuinfo()
--
--     -- Setiap 5 detik (5000ms), perbarui statusline
--     vim.fn.timer_start(5000, function()
--       get_meminfo() -- Update nilai memori
--       get_cpuinfo() -- Update nilai cpu
--       vim.cmd("redrawstatus") -- Perbarui statusline
--     end)
--
--     -- PERF: we don't need this lualine require madness 🤷
--     local lualine_require = require("lualine_require")
--     lualine_require.require = require
--
--     local icons = LazyVim.config.icons
--
--     vim.o.laststatus = vim.g.lualine_laststatus
--
--     local opts = {
--       options = {
--         theme = "auto",
--         globalstatus = vim.o.laststatus == 3,
--         disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
--       },
--       sections = {
--         lualine_a = { "mode" },
--         lualine_b = { "branch" },
--
--         lualine_c = {
--           LazyVim.lualine.root_dir(),
--           {
--             "diagnostics",
--             symbols = {
--               error = icons.diagnostics.Error,
--               warn = icons.diagnostics.Warn,
--               info = icons.diagnostics.Info,
--               hint = icons.diagnostics.Hint,
--             },
--           },
--           { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
--           { LazyVim.lualine.pretty_path() },
--         },
--         lualine_x = {
--
--           Snacks.profiler.status(),
--           -- stylua: ignore
--           {
--             function() return require("noice").api.status.command.get() end,
--             cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
--             color = function() return { fg = Snacks.util.color("Statement") } end,
--           },
--           -- stylua: ignore
--           {
--             function() return require("noice").api.status.mode.get() end,
--             cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
--             color = function() return { fg = Snacks.util.color("Constant") } end,
--           },
--           -- stylua: ignore
--           {
--             function() return "  " .. require("dap").status() end,
--             cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
--             color = function() return { fg = Snacks.util.color("Debug") } end,
--           },
--           -- stylua: ignore
--           {
--             require("lazy.status").updates,
--             cond = require("lazy.status").has_updates,
--             color = function() return { fg = Snacks.util.color("Special") } end,
--           },
--           {
--             "diff",
--             symbols = {
--               added = icons.git.added,
--               modified = icons.git.modified,
--               removed = icons.git.removed,
--             },
--             source = function()
--               local gitsigns = vim.b.gitsigns_status_dict
--               if gitsigns then
--                 return {
--                   added = gitsigns.added,
--                   modified = gitsigns.changed,
--                   removed = gitsigns.removed,
--                 }
--               end
--             end,
--           },
--         },
--         lualine_y = {
--           -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
--           {
--             function()
--               return string.format("Mem: %s | CPU: %s⚡", meminfo, cpuinfo)
--             end,
--             color = { fg = "#82aaff", bg = "#292d3e" },
--             separator = " ",
--             padding = { left = 1, right = 0 },
--           },
--           { "location", padding = { left = 1, right = 1 } },
--         },
--         lualine_z = {
--           function()
--             return " " .. os.date("%R")
--           end,
--         },
--       },
--       extensions = { "neo-tree", "lazy", "fzf" },
--     }
--
--     -- do not add trouble symbols if aerial is enabled
--     -- And allow it to be overriden for some buffer types (see autocmds)
--     if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
--       local trouble = require("trouble")
--       local symbols = trouble.statusline({
--         mode = "symbols",
--         groups = {},
--         title = false,
--         filter = { range = true },
--         format = "{kind_icon}{symbol.name:Normal}",
--         hl_group = "lualine_c_normal",
--       })
--       table.insert(opts.sections.lualine_c, {
--         symbols and symbols.get,
--         cond = function()
--           return vim.b.trouble_lualine ~= false and symbols.has()
--         end,
--       })
--     end
--
--     return opts
--   end,
-- }
