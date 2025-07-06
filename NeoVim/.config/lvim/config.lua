require("keymaps")
require("theme")

-- Load all plugins dynamically from the plugins/ folder
local plugins = require("plugins")
lvim.plugins = vim.list_extend(lvim.plugins or {}, plugins)

-- Line settings
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true -- wrap lines
