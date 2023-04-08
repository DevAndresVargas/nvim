return {
    'nvim-telescope/telescope.nvim',
    brench = '0.1.0',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true
        }
    },
    init = function()
        require "alpha.telescope"
    end,
    lazy = true
}
