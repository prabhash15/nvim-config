return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional but highly recommended for icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Basic keymap to toggle the file tree sidebar
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true })
  end
}
