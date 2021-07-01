vim.g.mapleader = ' '

-- Stop hightlighting search matches
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<CR>', { noremap = true, silent = true })

-- Switch windows easier
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- Close current tab
vim.api.nvim_set_keymap('n', '<S-x>', ':BufferClose<CR>', { noremap = true, silent = true })

-- Switch to next/previous tab
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })

-- Switch to nth tab
vim.api.nvim_set_keymap('n', '<A-1>', ':BufferGoto 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-2>', ':BufferGoto 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-3>', ':BufferGoto 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-4>', ':BufferGoto 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-5>', ':BufferGoto 5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-6>', ':BufferGoto 6<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-7>', ':BufferGoto 7<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-8>', ':BufferGoto 8<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-9>', ':BufferGoto 9<CR>', { noremap = true, silent = true })

-- Copy/cut/paste to/from system clipboard
vim.api.nvim_set_keymap('n', '<LEADER>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', '<LEADER>y', '"+yy', { noremap = true })
vim.api.nvim_set_keymap('v', '<LEADER>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<LEADER>d', '"+dd', { noremap = true })
vim.api.nvim_set_keymap('v', '<LEADER>d', '"+d', { noremap = true })
vim.api.nvim_set_keymap('v', '<LEADER>x', '"+x', { noremap = true })

-- Reselect selected lines after incrementing/decrementing indent level
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Toggle nvim-tree
vim.api.nvim_set_keymap(
    'n', '<LEADER>e', ':lua toggle_tree()<CR>',
    { noremap = true, silent = true }
)

