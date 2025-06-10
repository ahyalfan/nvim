-- respurce https://github.com/kndndrj/nvim-dbee?tab=readme-ov-file

return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup({--[[optional config]]
        -- dbee_binary_path = vim.fn.stdpath("data") .. "/lazy/nvim-dbee/dbee",
      })
    end,
  },
}
