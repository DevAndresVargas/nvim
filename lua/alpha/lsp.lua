local lsp = require("lsp-zero")
require("luasnip.loaders.from_vscode").lazy_load()
local lspkind = require "lspkind"
lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
})

--require('luasnip').filetype_extend("dart", { "flutter" })
-- Fix Undefined global 'vim'
lsp.nvim_workspace()



local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            mode = 'symbol',
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
                ["vim-dadbod-completion"] = "[DB]",
            },
        },
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    })
})


cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
    sources = cmp.config.sources({
        { name = "vim-dadbod-completion" },
    }, {
        { name = "buffer" },
    }),
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '',
        warn = '',
        hint = '󰋗',
        info = ''
    }
})

lsp.on_attach(function(client, bufnr)
    local map_lsp = function(key, f, opts)
        local default = {
            mode = "n",
            options = {},
            buffer = bufnr,
            desc = nil,
        }
        opts = opts or {}
        opts = vim.tbl_deep_extend("force", default, opts or {})

        local rhs = function()
            f(opts.options)
        end

        local map_options = {
            remap = false,
            silent = true,
        }
        if opts.buffer then
            map_options.buffer = opts.buffer
        end
        if opts.desc then
            map_options.desc = "Lsp:" .. opts.desc
        end

        vim.keymap.set(opts.mode, key, rhs, map_options)
    end


    map_lsp("gd", vim.lsp.buf.definition, { desc = 'Definition' })
    map_lsp("gD", vim.lsp.buf.declaration, { desc = 'Declaration' })
    map_lsp("go", vim.lsp.buf.type_definition, { desc = 'Type Definition' })
    map_lsp("gr", vim.lsp.buf.references, { desc = 'References' })
    map_lsp("gs", vim.lsp.buf.signature_help, { desc = 'Help' })
    map_lsp("K", vim.lsp.buf.hover, {})
    map_lsp("<leader>vws", vim.lsp.buf.workspace_symbol, { desc = 'Workspace Symbol' })
    map_lsp("gl", vim.diagnostic.open_float, { desc = ' Diagnostics' })
    map_lsp("[d", vim.diagnostic.goto_next, {})
    map_lsp("]d", vim.diagnostic.goto_prev, {})
    map_lsp("<leader>ca", vim.lsp.buf.code_action, { desc = ' Code Actions' })
    map_lsp("<leader>cr", vim.lsp.buf.references, { desc = 'View references' })
    map_lsp("<C-h>", vim.lsp.buf.signature_help, {})
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
