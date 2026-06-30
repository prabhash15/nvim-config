return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- Optional but highly recommended additions:
    "nvim-telescope/telescope.nvim", -- Or "ibhagwan/fzf-lua" / "echasnovski/mini.picker"
    "nvim-tree/nvim-web-devicons",   -- For icons on the dashboard
    "rcarriga/nvim-notify",          -- For cleaner popup popups instead of standard echo
  },
  opts = {
    -- The argument passed to Neovim to start the plugin directly via shell terminal
    -- e.g., running `nvim leetcode.nvim` in your terminal
    arg = "leetcode.nvim",

    -- Your preferred programming language.
    -- Options include: "c", "cpp", "python3", "java", "rust", "go", "javascript", "typescript", etc.
    lang = "cpp",

    -- Configuration for the LeetCode China mirror region
    cn = {
      enabled = false,            -- Set to true if you use leetcode.cn
      translator = true,         -- Translate problem statements if available
      translate_problems = true, -- Translate problem list items
    },

    -- Where the plugin downloads questions and saves your working solution buffers
    storage = {
      home = vim.fn.stdpath("data") .. "/leetcode",
      cache = vim.fn.stdpath("cache") .. "/leetcode",
    },

    -- Saves logs in the standard Neovim log path for easy debugging if things break
    logging = true,

    -- Caching configuration for optimization
    cache = {
      update_interval = 60 * 60 * 24 * 7, -- How often to fetch all available problems (7 days)
    },

    -- Console layout where test runs and outputs show up
    console = {
      open_on_runcode = true, -- Open console instantly when running code
      dir = "row",            -- "col" for vertical split, "row" for horizontal split
      size = {
        width = "90%",
        height = "75%",
      },
      result = {
        size = "60%",         -- Percent of the console window allocated to outputs
      },
      testcase = {
        size = "40%",         -- Percent of the console window allocated to input test cases
      },
    },

    -- Description configuration panel layout
    description = {
      position = "left",      -- "left", "right", "top", "bottom"
      width = "40%",          -- Width of description layout pane when split vertically
      height = "40%",         -- Height of description layout pane when split horizontally
      show_stats = true,      -- Displays likes/dislikes and accept rates alongside problem info
    },

    -- Code injection configurations. This wraps your file with template helpers.
    -- Perfect for importing boilerplate headers locally so your LSP does not error out.
    injector = {
      ["cpp"] = {
        before = { "#include <iostream>", "#include <vector>", "using namespace std;" },
        after = {},
      },
      ["c"] = {
        before = { "#include <stdio.h>", "#include <stdlib.h>" },
        after = {},
      },
    },

    -- Custom Keymaps assigned specifically inside leetcode buffers
    keys = {
      toggle_toggle = { "q" },          -- Closes console panels / current leet menu
      confirm = { "<CR>" },             -- Select / open option
      reset_testcases = { "r" },        -- Resets problem cases back to default
      use_testcase = { "U" },           -- Uses your current selection as testcase
    },

    -- Extra options for advanced configurations
    theme = {},                         -- Can override internal highlights to match your colorscheme
    image_support = require("prabhash.portable").supports_image_nvim(), -- Only enable when the active terminal/backend can render it
  },
}
