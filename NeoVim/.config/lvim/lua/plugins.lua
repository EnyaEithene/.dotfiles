-- plugins.lua

local plugin_folder = vim.fn.stdpath("config") .. "/lua/plugins"
local plugin_paths = vim.fn.glob(plugin_folder .. "/*.lua", true, true)

local plugins = {}

for _, path in ipairs(plugin_paths) do
  -- Extract module name from file path, e.g. plugins/catppuccin.lua -> "plugins.catppuccin"
  local module_name = path:match("lua/(.+)%.lua$")
  if module_name then
    local ok, plugin_list = pcall(require, module_name)
    if ok and type(plugin_list) == "table" then
      for _, plugin in ipairs(plugin_list) do
        table.insert(plugins, plugin)
      end
    else
      print("Warning: Failed to load plugin module '" .. module_name .. "'")
    end
  end
end

return plugins
