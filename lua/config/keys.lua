local map = vim.keymap.set
vim.g.mapleader = " "

map("v", "<leader>p", '"_dp')
map("n", "<leader>bd", ':bd!<CR>')

map("n", '<TAB><TAB>', ':bnext<CR>')
map("n", '<S-TAB>', ':bprevious<CR>')

-- tabulation
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Close buffer
map("n", "<C-b>", ":bd<CR>")

-- Save
map("n", "ss", ":w<CR>")

-- Qut and save
map("n", "<C-q>", ":wq!<CR>")

-- -- Window navigation
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")


-- epic remplace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


--crear archivo

function create_file()
    local path = vim.fn.input('Path: ')
    local filename = vim.fn.input('File name: ')
    local filepath = path .. '/' .. filename
    vim.cmd('e ' .. filepath)
end

vim.cmd('command! -nargs=0 CreateFile :lua create_file()')
map("n", "<leader>nf", ":CreateFile<cr>")
