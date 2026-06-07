
return {
  'neovim/nvim-lspconfig',
  dependencies = { 
    'saghen/blink.cmp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  opts = {
    -- Servers you want installed and configured
    servers = {
      lua_ls = {},
      pyright = {},
      clangd = {},
      gopls = {},
      bashls = {}
    },
  },

  config = function(_, opts)
    local blink = require('blink.cmp')
    local mason_lspconfig = require('mason-lspconfig')

    -- Get autocomplete capabilities
    local base_capabilities = blink.get_lsp_capabilities()

    -- 1. Pre-register all your servers with Neovim's modern native API
    for server_name, server_opts in pairs(opts.servers) do
      server_opts.capabilities = vim.tbl_deep_extend(
        'force',
        base_capabilities,
        server_opts.capabilities or {}
      )
      -- Define the configuration natively before mason triggers it
      vim.lsp.config(server_name, server_opts)
    end

    -- 2. Build the list of servers to ensure Mason downloads them
    local ensure_installed = {}
    for server, _ in pairs(opts.servers) do
      table.insert(ensure_installed, server)
    end

    -- 3. Run Mason-LSPconfig v2 setup
    mason_lspconfig.setup({
      ensure_installed = ensure_installed,
      -- v2 feature: automatically runs vim.lsp.enable() for installed servers
      automatic_enable = true, 
    })
  end,
}

