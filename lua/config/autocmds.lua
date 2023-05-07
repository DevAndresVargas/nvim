local function set_default_options()
    vim.opt_local.shiftwidth = 0
    vim.opt_local.tabstop = 3
    vim.opt_local.expandtab = false
end

-- Grupo de autocmd para BufWritePre
vim.api.nvim_command("augroup AuBufWritePre")
vim.api.nvim_command("  autocmd!")
vim.api.nvim_command("  autocmd BufWritePre * let current_pos = getpos(\".\")")
vim.api.nvim_command("  autocmd BufWritePre * silent! undojoin | %s/\\s\\+$//e")
vim.api.nvim_command("  autocmd BufWritePre * silent! undojoin | %s/\\n\\+\\%$//e")
vim.api.nvim_command("  autocmd BufWritePre * call setpos(\".\", current_pos)")
vim.api.nvim_command("  autocmd BufWritePre,FileWritePre *.lua lua vim.lsp.buf.format()")
vim.api.nvim_command("  autocmd BufWritePre,FileWritePre *.rs lua vim.lsp.buf.format()")
vim.api.nvim_command("  autocmd BufWritePre,FileWritePre *.go lua vim.lsp.buf.format()")
vim.api.nvim_command("  autocmd BufWritePre,FileWritePre *.py lua vim.lsp.buf.format()")
vim.api.nvim_command("  autocmd BufWritePre,FileWritePre *.html,*.css,*.js,*.ts,*.tsx lua vim.lsp.buf.format()")
vim.api.nvim_command("  autocmd BufWritePre,FileWritePre *.json,*.yml,*.yaml,*.xml,*.toml lua vim.lsp.buf.format()")
vim.api.nvim_command("  autocmd BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')")
vim.api.nvim_command("augroup END")

-- Grupo de autocmd para AuYank
vim.api.nvim_command("augroup AuYank")
vim.api.nvim_command("  autocmd!")
vim.api.nvim_command(
    "  autocmd TextYankPost * lua vim.highlight.on_yank{higroup=\"IncSearch\", timeout=400, on_visual=true}")
vim.api.nvim_command("augroup END")

-- -- Grupo de autocmd para numbertoggle
-- vim.api.nvim_command("augroup numbertoggle")
-- vim.api.nvim_command("  autocmd!")
-- vim.api.nvim_command("  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != \"i\" | set rnu | endif")
-- vim.api.nvim_command("  autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif")
-- vim.api.nvim_command("augroup END")

-- Grupo de autocmd para fileDetect
vim.api.nvim_command("augroup fileDetect")
vim.api.nvim_command("  autocmd!")
vim.api.nvim_command("  autocmd BufEnter * filetype detect")
vim.api.nvim_command("augroup END")

-- Llamar a la función para establecer las opciones predeterminadas
set_default_options()
