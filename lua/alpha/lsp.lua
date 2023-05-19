local lsp = require("lsp-zero")
require("luasnip.loaders.from_vscode").lazy_load()
lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
})

--require('luasnip').filetype_extend("dart", { "flutter" })
-- Fix Undefined global 'vim'
lsp.nvim_workspace()



local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- ['<C-p>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-n>'] = cmp.mapping.scroll_docs(4),
        -- ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        -- ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        -- ["xk"] = cmp.mapping.complete(),
    })
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
    local map_tele = function(key, f, opts)
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


    map_tele("gd", vim.lsp.buf.definition, { desc = 'Definition' })
    map_tele("gD", vim.lsp.buf.declaration, { desc = 'Declaration' })
    map_tele("go", vim.lsp.buf.type_definition, { desc = 'Type Definition' })
    map_tele("gr", vim.lsp.buf.references, { desc = 'References' })
    map_tele("gs", vim.lsp.buf.signature_help, { desc = 'Help' })
    map_tele("K", vim.lsp.buf.hover, {})
    map_tele("<leader>vws", vim.lsp.buf.workspace_symbol, { desc = 'Workspace Symbol' })
    map_tele("gl", vim.diagnostic.open_float, { desc = ' Diagnostics' })
    map_tele("[d", vim.diagnostic.goto_next, {})
    map_tele("]d", vim.diagnostic.goto_prev, {})
    map_tele("<leader>vca", vim.lsp.buf.code_action, { desc = ' Code Actions' })
    map_tele("<leader>vr", vim.lsp.buf.references, { desc = 'View references' })
    map_tele("<C-h>", vim.lsp.buf.signature_help, {})
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
