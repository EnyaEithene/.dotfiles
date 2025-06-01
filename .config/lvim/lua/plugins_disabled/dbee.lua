return {
    {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup({
        debug = true,
        connections = {
          {
            name = "xampp-mysql",
            type = "mysql",
            url = "mysql://root@127.0.0.1:3306/competitii_arta",
          },
        },
        ui = {
          border = "rounded", -- optional
        },
      })
    end,
  },
}
