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

-- Keymaps
lvim.keys.normal_mode["<leader>mp"] = function()
  vim.cmd("w") -- Save current buffer first
  local input = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r") .. ".pdf"
  local cmd = string.format(
    'pandoc "%s" -o "%s" --pdf-engine=xelatex',
    input,
    output,
    output
  )
  vim.cmd("!" .. cmd)
end

-- Open MySQL Terminal vertical split
function OpenMysqlTerminal()
  -- Open vertical split with width 80 columns
  vim.cmd("vsplit")            -- Open vertical split
  vim.cmd("vertical resize 60") -- Resize the split to 80 columns
  -- Open terminal and run MySQL client
  vim.cmd("terminal /opt/lampp/bin/mysql -u root")
end
-- Map <leader>mt to the function
lvim.keys.normal_mode["<leader>mt"] = OpenMysqlTerminal

-- Resize with arrow keys
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

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
