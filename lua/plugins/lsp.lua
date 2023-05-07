return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "lvimuser/lsp-inlayhints.nvim",
        "rafamadriz/friendly-snippets"

    },
    config = function()
        require "alpha.lsp"
    end,
    event = "VeryLazy",
}
