local wk = require("which-key")
local presets = require('which-key.plugins.presets')

-- NOTE: leadermap
wk.register({
    -- Custom mapping
    ['<leader>p'] = {
        name = '"_dp'
    },
    ['<leader>b'] = {
        name = 'buffer',
        d = 'delete'
    },
    ['<leader>h'] = {
        name = 'left window'
    },
    ['<leader>l'] = {
        name = 'right window'
    },
    ['<leader>j'] = {
        name = 'down window'
    },
    ['<leader>k'] = {
        name = 'up window'
    },
    ['<leader>q'] = {
        name = 'close window'
    },
    -- ['<leader>s'] = {
    --     name = 'epic replace'
    -- },
    ['<leader>n'] = {
        name = 'new',
        t = 'float term',
        f = 'file',
        c = 'comment'
    },
    -- refacoring mapping
    ['<leader>r'] = {
        name = 'refacoring',
        r = 'refacoring'
    },
    -- harpoon mapping
    ['<leader>a'] = {
        name = 'add harpoon',
    },
    -- database mapping
    ['<leader>o'] = {
        name = 'open',
        d = {
            name = 'database'
        }
    },
    -- code runner mapping
    ['<leader>x'] = {
        name = 'code',
        x = 'Run code',
        f = 'Run file'
    },
    -- Telescope mapping
    ['<leader>e'] = {
        name = "explorer",
        p = 'find file',
        w = 'grep word',
        s = 'string',
        c = 'config',
        n = 'nvim',
        h = 'help tags',
        b = 'buffer',
        d = 'treesitter',
        r = 'relative',
        e = 'explorer',
    },
    -- Lsp mapping
    ['<leader>v'] = {
        name = "Lsp buf",
        w = {
            name = 'workspace',
            s = 'sybol'
        },
        d = 'open float',
        c = {
            name = 'code',
            n = 'action',
        }
    }
})
