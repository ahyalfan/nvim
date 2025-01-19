-- bootstrap lazy.nvim, LazyVim and your plugins

-- Check and create .rgignore if it doesn't exist
local home = os.getenv("HOME")
local rgignore_path = home .. "/.rgignore"
local rgignore_file = io.open(rgignore_path, "r")

if not rgignore_file then
  -- If the file doesn't exist, create it and add the rule
  rgignore_file = io.open(rgignore_path, "w")
  if rgignore_file then
    rgignore_file:write("!.env*\n") -- Ensure .env is not ignored
    rgignore_file:close()
  end
else
  -- If the file exists, check if the rule is already present
  local content = rgignore_file:read("*all")
  if not content:find("!.env*") then
    -- Add the rule if it's not already there
    rgignore_file:close() -- Close first
    rgignore_file = io.open(rgignore_path, "a") -- Reopen in append mode
    rgignore_file:write("!.env*\n")
    rgignore_file:close()
  else
    rgignore_file:close() -- Just close if the rule is already present
  end
end

require("config.lazy")
