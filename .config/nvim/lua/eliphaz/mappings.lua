local bind = vim.keymap.set
local builtin = require('telescope.builtin') -- Useful for telescope

-- File explorer native vim
bind("n", "fe", "<cmd>Ex<CR>")

-- Close buffer
bind("n", "<leader>d", "<cmd>bdelete<CR>")

-- Telescope mappings
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>/', builtin.search_history, {})

