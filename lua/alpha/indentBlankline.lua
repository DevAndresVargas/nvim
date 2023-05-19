vim.opt.list = true
vim.opt.termguicolors = true
vim.opt.listchars:append "space: "
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_current_context = true,
    space_char_blankline = " ",
    show_current_context_start = true,
}
