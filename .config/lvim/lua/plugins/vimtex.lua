return {
   {
      "lervag/vimtex",
      ft = { "tex", "bib" },
      config = function()
        vim.g.vimtex_view_method = 'sioyek'
        vim.g.vimtex_callback_progpath = '/usr/local/bin/nvim'
        vim.api.nvim_set_keymap('n', '<leader>lt', ':VimtexTocToggle<CR>', { noremap = true, silent = true })

        vim.cmd("syntax enable")

        -- Use 'sioyek' as PDF viewer
        vim.g.vimtex_view_general_viewer = "sioyek"

        -- Use env var or hardcode servername
        local servername = vim.env.NVIM_LISTEN_ADDRESS or vim.v.servername or "/tmp/lvim"

        local options = string.format(
          '--reuse-window --inverse-search="nvr --servername %s +%%2 %%1" --forward-search-file @tex --forward-search-line @line @pdf',
          servername
        )
        vim.g.vimtex_view_general_options = options

        -- Tell vimtex compiler to use nvr for inverse search
        vim.g.vimtex_compiler_progname = "nvr"

        -- Completion mapping (\u a gets translated directly into .tex file)
        vim.g.vimtex_imaps_enabled = 1
      end,
    }
}

