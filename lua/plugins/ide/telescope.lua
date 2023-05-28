return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            dependencies = {
                "junegunn/fzf.vim",
                dependencies = {
                    {
                        "tpope/vim-dispatch",
                        cmd = { "Make", "Dispatch" },
                    },
                },
            },
        },
        {
            "nvim-tree/nvim-web-devicons",
            config = function()
                require "alpha.devicons"
            end
        },
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/popup.nvim" },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        {
            'L3MON4D3/LuaSnip',
            dependencies = { 'rafamadriz/friendly-snippets' },
        }
    },
    event = "VeryLazy",
    config = function()
        require "alpha.telescope.setup"
        require "alpha.telescope.mappings"
    end,
}
