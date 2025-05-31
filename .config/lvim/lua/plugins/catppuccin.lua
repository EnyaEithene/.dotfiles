return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          -- lvim = true,
          treesitter = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          telescope = true,
          which_key = true,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          dashboard = true,
          illuminate = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")

      vim.api.nvim_set_hl(0, "LineNr", { fg = "#a0a0a0", bg = "none" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#d75f5f", bg = "none", bold = true })
    end,
  },
}

