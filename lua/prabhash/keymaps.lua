vim.g.mapleader = " "
vim.keymap.set("n" , "<leader>op" , vim.cmd.Ex) 

vim.keymap.set("n", "<leader>]", ":bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>[", ":bp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", ":w | bd!<CR>", { noremap = true, silent = true })



