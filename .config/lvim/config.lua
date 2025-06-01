require("keymaps")

local config_lua_path = vim.fn.stdpath("config") .. "/lua/?.lua"
package.path = package.path .. ";" .. config_lua_path

local theme_dir = vim.fn.stdpath("config") .. "/themes"
local theme_paths = vim.fn.glob(theme_dir .. "/*", true, true)

for _, path in ipairs(theme_paths) do
  table.insert(lvim.plugins, { dir = path })
end
-- Plugins
local function flatten_plugin_modules(modules)
  local result = {}
  for _, name in ipairs(modules) do
    local list = require(name)
    for _, plugin in ipairs(list) do
      table.insert(result, plugin)
    end
  end
  return result
end

lvim.plugins = vim.list_extend(lvim.plugins or {}, flatten_plugin_modules({
  "plugins.git-stuff",
  "plugins.markdown_preview",
  "plugins.session",
  "plugins.vimtex",
  "plugins.catppuccin",
}))

-- Line settings
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true -- wrap lines

-- Theme
lvim.colorscheme = "catppuccin"
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "catppuccin",
  callback = function()
    -- Your custom highlights here
    vim.cmd([[highlight LineNr guifg=#7a7a7a]])  -- example darker gray
    vim.cmd([[highlight CursorLineNr guifg=#C0C0C0]])  -- lighter for current line number
  end,
})
