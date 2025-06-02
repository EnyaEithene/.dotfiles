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
        vim.g.tex_flavor = "latex"
        vim.opt.conceallevel = 2
        vim.opt.concealcursor = "nciv"  -- conceal in normal, command, insert, visual mode
        
        vim.opt.encoding = "utf-8"
        vim.opt.fileencoding = "utf-8"
        vim.cmd("syntax enable")
        
        -- Macros for tex files only
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "tex",
          callback = function()
            -- Insert-mode mappings
            vim.keymap.set("i", "<C-b>", "\\textbf{}<Left>", { buffer = true, desc = "Insert \\textbf{}" })
            vim.keymap.set("i", "<C-i>", "\\textit{}<Left>", { buffer = true, desc = "Insert \\textit{}" })
            vim.keymap.set("i", "<C-u>", "\\underline{}<Left>", { buffer = true, desc = "Insert \\underline{}" })
            vim.keymap.set("i", "<C-m>", "$$<Left>", { buffer = true, desc = "Insert inline math" })

            vim.keymap.set("i", "<A-[>", "\\u a", { buffer = true, noremap = true, desc = "Insert \\u a" })
            vim.keymap.set("i", "<A-]>", "\\^ i", { buffer = true, noremap = true, desc = "Insert \\u a" })
            vim.keymap.set("i", "<A-\\>", "\\^ a", { buffer = true, noremap = true, desc = "Insert \\u a" })
            vim.keymap.set("i", "<A-;>", "\\c s", { buffer = true, noremap = true, desc = "Insert \\u a" })
            vim.keymap.set("i", "<A-'>", "\\c t", { buffer = true, noremap = true, desc = "Insert \\u a" })

            -- Visual-mode mappings
            vim.keymap.set("v", "<C-b>", "<esc>`<i\\textbf{<esc>`>a}<esc>", { buffer = true, desc = "Wrap in \\textbf{}" })
            vim.keymap.set("v", "<C-i>", "<esc>`<i\\textit{<esc>`>a}<esc>", { buffer = true, desc = "Wrap in \\textit{}" })
          end,
        })
      end,
    }
}

