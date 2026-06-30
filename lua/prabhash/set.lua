-- Optional providers are disabled until explicitly needed. This keeps fresh
-- machines quiet without requiring global npm/gem/cpan/pip provider packages.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.number = true
vim.opt.relativenumber = true

-- No swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Indentation
vim.opt.tabstop = 4         -- Display width of tab
vim.opt.shiftwidth = 4      -- Size of indent
vim.opt.softtabstop = 4     -- Number of spaces when pressing tab
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.smartindent = true  -- Smart indenting on new lines
vim.opt.autoindent = true   -- Auto-indent current line


-- Enable mouse support
vim.opt.mouse = ""

-- Show matching parentheses
vim.opt.showmatch = true

-- Use system clipboard only when the host actually provides one.
if require("prabhash.portable").has_clipboard_provider() then
    vim.opt.clipboard = "unnamedplus"
end

-- Don't show mode (e.g., -- INSERT --) if you use a statusline
vim.opt.showmode = false

vim.opt.termguicolors = true


