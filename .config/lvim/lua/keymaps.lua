-- Keymaps
-- Navigate vim panes better
lvim.keys.normal_mode["<C-h>"] = "<C-w>h"
lvim.keys.normal_mode["<C-j>"] = "<C-w>j"
lvim.keys.normal_mode["<C-k>"] = "<C-w>k"
lvim.keys.normal_mode["<C-l>"] = "<C-w>l"

-- Navigate tabs
vim.keymap.set("n", "<leader>h", ":tabprevious<CR>", { silent = true, desc = "Previous Tab" })
vim.keymap.set("n", "<leader>l", ":tabnext<CR>", { silent = true, desc = "Next Tab" })

-- Pandoc for markdown (WIP)
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


