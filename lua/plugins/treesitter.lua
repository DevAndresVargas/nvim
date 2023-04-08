return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash",
                "css",
                "go",
                "gomod",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "nix",
                "php",
                "phpdoc",
                "query",
                "rust",
                "svelte",
                "typescript",
                "vim",
                "yaml",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            auto_install = true,
            sync_install = false,
        }
    end,
}
