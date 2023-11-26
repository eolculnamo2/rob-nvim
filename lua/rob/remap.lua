vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>")
vim.keymap.set("n", "<S-h>", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<S-l>", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "<S-i>", "<Cmd>BufferPick<CR>")

-- LSP
vim.keymap.set("n", "<leader>/",
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end)
vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation)

vim.keymap.set("n", "<leader>ba", "<Cmd>BufferCloseAllButVisible<CR>")
vim.keymap.set("n", "<leader>bA", "<Cmd>BufferWipeout<CR>")
vim.keymap.set("n", "<leader>bl", "<Cmd>BufferCloseBuffersLeft<CR>")
vim.keymap.set("n", "<leader>br", "<Cmd>BufferCloseBuffersRight<CR>")
