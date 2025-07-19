return  {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require("alpha.themes.startify")
      local dashboard = require("alpha.themes.dashboard")
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = "devicons"
      -- Your custom greeting
      dashboard.section.header.val = {
  "                             _              ",
  "  ____  ____  ___     ____  (_)__  ________ ",
  " / __ \\/ __ \\/ _ \\   / __ \\/ / _ \\/ ___/ _ \\",
  "/ /_/ / / / /  __/  / /_/ / /  __/ /__/  __/",
  "\\____/_/ /_/\\___/  / .___/_/\\___/\\___/\\___/ ",
  "                  /_/                       ",
  "",
      }
dashboard.section.buttons.val = {
         dashboard.button("q", "🚪  Quit Neovim" , ":q!<CR>"),}
      dashboard.opts.opts.noautocmd = true
      require("alpha").setup(
          dashboard.config
      )
  end,
  }
