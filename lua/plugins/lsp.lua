return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "lvimuser/lsp-inlayhints.nvim"

    },
    config = function()
        require "alpha.lsp"
    end,
    event = "VeryLazy",
}
