return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
    lazy = false,
    cmd = { "TodoTrouble", "TodoTelescope", "TodoQuickFix" },
    keys = {
        { '<leader>tt', ':TodoTelescope<cr>', desc = 'Explorer' },
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
        },
        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
        },
    },
}
-- TODO: test
