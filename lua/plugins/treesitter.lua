return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ok, treesitter = pcall(require, "nvim-treesitter")
    if not ok then
      return
    end

    local parsers = {
      "bash",
      "c",
      "cpp",
      "go",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "vim",
      "vimdoc",
    }

    -- nvim-treesitter's main branch is the supported API for Neovim 0.12+.
    treesitter.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- Keep parsers present without blocking startup. :TSUpdate still refreshes them.
    -- Only request missing parsers; otherwise Neovim would announce downloads on every launch.
    pcall(function()
      local installed = {}
      for _, lang in ipairs(treesitter.get_installed("parsers")) do
        installed[lang] = true
      end

      local missing = {}
      for _, lang in ipairs(parsers) do
        if not installed[lang] then
          table.insert(missing, lang)
        end
      end

      if #missing > 0 then
        treesitter.install(missing)
      end
    end)

    local treesitter_filetypes = {
      "c",
      "cpp",
      "go",
      "lua",
      "markdown",
      "python",
      "query",
      "sh",
      "vim",
      "vimdoc",
    }

    local group = vim.api.nvim_create_augroup("PrabhashTreesitter", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = treesitter_filetypes,
      callback = function(args)
        local name = vim.api.nvim_buf_get_name(args.buf)
        local ok_stat, stats = pcall(vim.uv.fs_stat, name)
        if ok_stat and stats and stats.size > 100 * 1024 then
          return
        end

        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
