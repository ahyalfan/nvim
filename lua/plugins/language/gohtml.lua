return {
  -- Custom filetype mapping for .gohtml
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.filetype.add({
        extension = {
          gohtml = "gotmpl",
        },
      })
    end,
  },
}
