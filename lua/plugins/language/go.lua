return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "fredrikaverpil/neotest-golang",
    },
    opts = {
      adapters = {
        ["neotest-golang"] = {
          -- Here we can set options for neotest-golang, e.g.
          go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
          dap_go_enabled = true, -- requires leoluz/nvim-dap-go
        },
      },
    },
  },
  -- {
  --   "crispgm/nvim-go",
  --   ft = { "go" },
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("go").setup({})
  --   end,
  -- },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- lsp_keymaps = false,
      -- other options
    },
    config = function(lp, opts)
      require("go").setup(opts)
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimports()
        end,
        group = format_sync_grp,
      })

      -- keymap go impl
      vim.keymap.set("n", "gL", function()
        local struct_name = vim.fn.expand("<cword>")
        if not struct_name or struct_name == "" then
          vim.notify("Struct tidak ditemukan", vim.log.levels.ERROR)
          return
        end

        local iface = vim.fn.input("Interface (misal: io.Reader / repository.Client): ")
        if iface == "" then
          vim.notify("Interface wajib diisi", vim.log.levels.WARN)
          return
        end

        local receiver = struct_name:sub(1, 1):lower()
        local cmd = string.format("GoImpl %s *%s %s", receiver, struct_name, iface)
        vim.cmd(cmd)
      end, { desc = "Go: Generate interface implementation" })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
