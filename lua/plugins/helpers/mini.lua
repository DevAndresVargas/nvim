return {
    'echasnovski/mini.nvim',
    {
        'echasnovski/mini.comment',
        version = false,
        config = function()
            require 'alpha.mini.comment'
        end
    },
    {
        'echasnovski/mini.cursorword',
        version = false,
        config = function()
            require('mini.cursorword').setup({
                delay = 50,
            })
        end
    },
    {
        'echasnovski/mini.splitjoin',
        version = false,
        config = function() require 'alpha.mini.splitjoin' end
    }
}
