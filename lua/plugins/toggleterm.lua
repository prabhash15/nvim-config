return {
  'akinsho/toggleterm.nvim',
  version = "*",

  config = function()
    require("toggleterm").setup({
      size = 12,
      open_mapping = [[<c-\>]], -- toggle terminal
      direction = "horizontal",
      start_in_insert = true,
      persist_size = true,
      close_on_exit = true, -- auto close when program ends
    })

    -- easier escape from terminal
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

    -- move back to code (up)
    vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])

    -- kill terminal quickly
    vim.keymap.set("n", "<leader>tk", "<cmd>ToggleTermToggleAll<CR>")
  end,
}
