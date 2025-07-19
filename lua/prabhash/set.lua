
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
vim.opt.mouse = 'a'

-- Show matching parentheses
vim.opt.showmatch = true

-- Use system clipboard (optional)
vim.opt.clipboard = 'unnamedplus'

-- Don't show mode (e.g., -- INSERT --) if you use a statusline
vim.opt.showmode = false

