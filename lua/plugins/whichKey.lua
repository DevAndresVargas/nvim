return {
    "folke/which-key.nvim",

    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require 'alpha.whichKey'
    end,
}
