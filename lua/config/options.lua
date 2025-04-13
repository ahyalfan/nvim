-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Lazy config for asdf package manager
-- Inject ASDF shims path to $PATH so LSP/tools can find executables like `go`, `gopls`, etc
local asdf_shims = os.getenv("HOME") .. "/.asdf/shims"
if not string.find(vim.env.PATH, asdf_shims, 1, true) then
  vim.env.PATH = asdf_shims .. ":" .. vim.env.PATH
end
