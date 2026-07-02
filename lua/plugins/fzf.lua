return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for icons
    },
    cmd = "FzfLua",
    keys = {
      { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find Files" },
      { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live Grep" },
      { "<leader>fb", function() require("fzf-lua").buffers() end, desc = "Buffers" },
      { "<leader>fr", function() require("fzf-lua").oldfiles() end, desc = "Recent Files" },
      { "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Keymaps" },
    },
    opts = {
      "default",

      winopts = {
        height = 0.85,
        width = 0.80,
        preview = {
          layout = "vertical",
          vertical = "right:50%",
        },
      },

      oldfiles = {
        include_current_session = true,
      },

      files = {
        hidden = true,
      },

      grep = {
        hidden = true,
      },

      fzf_opts = {
        ["--layout"] = "reverse",
        ["--info"] = "inline",
      },
    },
  },
}
