return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        {
            'williamboman/mason.nvim',
            build = function()
                pcall('MasonUpdate', vim.cmd)
            end,
        },
        'williamboman/mason-lspconfig.nvim',
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',

        -- Snippets
        {
            'L3MON4D3/LuaSnip',
            dependencies = 'rafamadriz/friendly-snippets',
            config = function()
                -- require 'luasnip'.filetype_extend('dart', { 'flutter' })
                require 'alpha.luasnip'
            end
        } },
    event = "VeryLazy",
    config = function()
        require "alpha.lsp"
    end,
}
