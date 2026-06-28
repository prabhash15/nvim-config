
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
        lua_ls = {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = vim.api.nvim_get_runtime_file('', true),
                    },
                },
            },
        },

        pyright = {},
        clangd = {},
        gopls = {
            filetypes = { 'go', 'gomod', 'gowork' },
        },
        bashls = {},
    },
},

  config = function(_, opts)
    local blink = require('blink.cmp')
    local mason_lspconfig = require('mason-lspconfig')

    vim.diagnostic.config({
      virtual_text = { spacing = 2, prefix = '●' },
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('PrabhashLspKeymaps', { clear = true }),
      callback = function(event)
        local map = function(lhs, rhs, desc)
          vim.keymap.set('n', lhs, rhs, { buffer = event.buf, silent = true, desc = desc })
        end

        map('K', function()
          vim.lsp.buf.hover({ border = 'rounded' })
        end, 'LSP hover documentation')
        map('gd', vim.lsp.buf.definition, 'LSP go to definition')
        map('gD', vim.lsp.buf.declaration, 'LSP go to declaration')
        map('gr', vim.lsp.buf.references, 'LSP references')
        map('<leader>rn', vim.lsp.buf.rename, 'LSP rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'LSP code action')
        map('<leader>e', vim.diagnostic.open_float, 'Line diagnostics')
      end,
    })

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

