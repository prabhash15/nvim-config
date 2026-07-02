return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        progress = {
          enabled = true,
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
        },
      },

      presets = {
        bottom_search = true,         -- use classic bottom cmdline for search
        command_palette = true,       -- position cmdline & popup together
        long_message_to_split = true, -- long messages in a split
        inc_rename = false,           -- enable if using inc-rename.nvim
        lsp_doc_border = true,        -- border around LSP docs
      },

      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },

      messages = {
        enabled = true,
      },

      notify = {
        enabled = true,
        view = "notify",
      },

      popupmenu = {
        enabled = true,
        backend = "nui",
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      background_colour = "#000000",
      render = "wrapped-compact",
    },
    config = function(_, opts)
      local notify = require("notify")
      notify.setup(opts)
      vim.notify = notify
    end,
  },
}
