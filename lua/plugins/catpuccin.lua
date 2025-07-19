return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- load before all other plugins
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",-- latte, frappe, macchiato, mocha
      transparent_background = true,
      integrations = {
        telescope = true,
        cmp = true,
        gitsigns = true,
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
      }
    })
    vim.cmd.colorscheme "catppuccin"
  end,
}

