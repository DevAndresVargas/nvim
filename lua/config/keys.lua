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
vim.g.mapleader = " "

-- Verifica si which-key está disponible
if pcall(require, "which-key") then
    -- Carga los atajos utilizando which-key
    local wk = require("which-key")
    -- Define tus atajos utilizando which-key
    wk.register({
        ["<leader>p"] = { '"_dp', "Delete Selection and Paste" },
        ["<leader>bD"] = { ':bd!<CR>', " Force Close Current Buffer" },
        ["<leader>u"] = { 'guiwe', "Lower " },
        ["<leader>U"] = { 'gUiwe', "Upper " },
        ["<TAB><TAB>"] = { ':bnext<CR>', "Next buffer" },
        ["<S-TAB>"] = { ':bprevious<CR>', "Previous buffer" },
        ["<TAB>1"] = { ':tabn 1<CR>', "TAB 1" },
        ["<TAB>2"] = { ':tabn 2<CR>', "TAB 2" },
        ["<TAB>3"] = { ':tabn 3<CR>', "TAB 3" },
        ["<C-b>"] = { ':bd<CR>', "Close Current Buffer" },
        ["ss"] = { ':w<CR>', "Save Current File" },
        ["<"] = { '<gv','Tob left',mode='v' },
        [">"] = { '>gv','Tob rigth',mode='v' },
        ["<C-q>"] = { ':wq!<CR>', "Save and Quit" },
        ["<leader>h"] = { "<C-w>h", "Nav Left Window" },
        ["<leader>j"] = { "<C-w>j", "Nav Bottom Window" },
        ["<leader>k"] = { "<C-w>k", "Nav Top Window" },
        ["<leader>l"] = { "<C-w>l", "Nav Right Window" },
        ["<leader>q"] = { "<C-w>q", "Quit Current Window" },
        ["<leader>bd"] = { ':bp<bar>sp<bar>bn<bar>bd<CR>', "Close buffer Keep Window" },
        ["<leader>nr"] = { ':%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>', "Epic Replace" },
        ["<leader>nR"] = { ":.,$s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>", "Epic Replace FW" },
        ["<leader>na"] = { ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', "Epic EpicAppend" },
        ["<leader>nA"] = { ":.,$s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Epic EpicAppend FW" },
        ["<leader>bc"] = { ":up | %bd | e#<CR>", "Clean Buffers" }
    })
else
    -- Carga los atajos sin which-key
    local map = vim.keymap.set
    -- Agrega más atajos alternativos según sea necesario
    --
    map("v", "<leader>p", '"_dp')
    map("n", "<leader>bD", ':bd!<CR>')
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
    map("n", "<leader>q", "<C-w>q")
    map("n", "<leader>bd", ':bp<bar>sp<bar>bn<bar>bd<CR>')
    -- epic remplace
    map("n", "<leader>nr", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
    map("n", "<leader>nR", [[:.,$s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>]])
    map("n", "<leader>na", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
    map("n", "<leader>nA", [[:.,$s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>]])
    map('n', '<leader>nf', ':CreateFile<CR>')
end
