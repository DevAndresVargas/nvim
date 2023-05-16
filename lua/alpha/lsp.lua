local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
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


    map_tele("gd", vim.lsp.buf.definition, { desc = 'Go Definition' })
    map_tele("K", vim.lsp.buf.hover, {})
    map_tele("<leader>vws", vim.lsp.buf.workspace_symbol, { desc = 'Workspace Symbol' })
    map_tele("<leader>vd", vim.diagnostic.open_float, { desc = 'View Diagnostics' })
    map_tele("[d", vim.diagnostic.goto_next, {})
    map_tele("]d", vim.diagnostic.goto_prev, {})
    map_tele("<leader>vca", vim.lsp.buf.code_action, { 'View Code Actions' })
    map_tele("<leader>vrr", vim.lsp.buf.references, { 'View references' })
    map_tele("<leader>vrn", vim.lsp.buf.rename, {})
    map_tele("<C-h>", vim.lsp.buf.signature_help, {})
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
