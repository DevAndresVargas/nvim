require('code_runner').setup({
    -- put here the commands by filetype
    filetype = {
        java = {
            "cd $dir &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt"
        },
        python = "py -u",
        typescript = "deno run",
        rust = {
            "cd $dir &&",
            "rustc $fileName &&",
            "$dir$fileNameWithoutExt"
        },
    },
})


vim.keymap.set('n', '<leader>xx', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>xf', ':RunFile<CR>', { noremap = true, silent = false })
