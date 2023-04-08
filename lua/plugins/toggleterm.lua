return {
    'voldikss/vim-floaterm',
    keys = {
        { '<leader>nt', ":FloatermNew<cr>" },
        { '<esc>nt',    "<C-\\><C-n>:FloatermNew<cr>",    mode = "t" },
        { '<leader>t',  ":FloatermToggle<cr>" },
        { '<esc>t',     "<C-\\><C-n>:FloatermToggle<cr>", mode = "t" },
        { '<esc>p',     "<C-\\><C-n>:FloatermPrev<cr>",   mode = "t" },
        { '<esc>n',     "<C-\\><C-n>:FloatermNext<cr>",   mode = "t" },
    },
    config = true,
}
