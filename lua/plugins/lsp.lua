return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },

  opts = {
    servers = {
      lua_ls = {},
      pyright = {},
      clangd = {},
      gopls = {},
    },
  },

  config = function(_, opts)
    local blink = require('blink.cmp')

    local base_capabilities = blink.get_lsp_capabilities()

    for server, server_opts in pairs(opts.servers) do
      server_opts.capabilities = vim.tbl_deep_extend(
        'force',
        base_capabilities,
        server_opts.capabilities or {}
      )

      vim.lsp.config(server, server_opts)
      vim.lsp.enable(server)
    end
  end,
}
