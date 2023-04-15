return {
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        require "startup".setup({
            theme = 'ggm',
            colors = {
                background = "#A6E3A1"
            }
        })
    end,
}
