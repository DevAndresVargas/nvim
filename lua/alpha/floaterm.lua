local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>nt', ":FloatermNew<cr>")
vim.keymap.set('t', '<esc>nt', "<C-\\><C-n>:FloatermNew<cr>")
vim.keymap.set('n', '<leader>t', ":FloatermToggle<cr>")
vim.keymap.set('t', '<esc>t', "<C-\\><C-n>:FloatermToggle<cr>")
vim.keymap.set('t', '<esc>p', "<C-\\><C-n>:FloatermPrev<cr>")
vim.keymap.set('t', '<esc>n', "<C-\\><C-n>:FloatermNext<cr>")

vim.api.nvim_set_var('floaterm_shell', 'pwsh')
