-- ~/.config/nvim/lua/telescope.lua

local M = {}

-- Function to find the git root directory based on the current buffer's path
function M.find_git_root()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  if current_file == "" then
    current_dir = cwd
  else
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- Get Git root directory
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not a git repository. Searching on current working directory")
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
function M.live_grep_git_root()
  local git_root = M.find_git_root()
  if git_root then
    require("telescope.builtin").live_grep({
      search_dirs = { git_root }, -- Limit search to git root
    })
  end
end

-- You can also use this function to delay the execution until very lazy loading
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      fn()
    end,
  })
end

return M
