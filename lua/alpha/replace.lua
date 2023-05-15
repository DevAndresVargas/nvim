local map = vim.api.nvim_set_keymap

-- Trigger EasyReplace with normal mode mapping
map('n', '<Leader>r', '<Plug>(EasyReplace)', {})
map('n', '<Leader>R', '<Plug>(EasyReplaceReverse)', {})

-- Trigger EasyReplace with visual mode mapping
map('x', '<Leader>r', '<Plug>(EasyReplace)', {})
map('x', '<Leader>R', '<Plug>(EasyReplaceReverse)', {})
