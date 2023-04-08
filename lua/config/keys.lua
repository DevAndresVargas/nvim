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

-- Crea un nuevo archivo
-- Si se proporciona la ruta, también crea la carpeta si no existe
function create_file()
    local name = vim.fn.input('Nombre del archivo: ')
    if not name or #name == 0 then
        return
    end

    local path = vim.fn.input('Ruta (opcional): ')
    if path and #path > 0 then
        vim.fn.mkdir(path, 'p')
        name = path .. '/' .. name
    end

    local file = io.open(name, 'w')
    io.close(file)
    vim.cmd('edit ' .. name)
end

vim.cmd('command! -nargs=0 CreateFile :lua create_file()')

-- Asigna la tecla de acceso rápido <leader>nf a la función create_file()
vim.api.nvim_set_keymap('n', '<leader>nf', ':CreateFile<CR>', { noremap = true, silent = true })
