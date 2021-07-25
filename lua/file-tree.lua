vim.g.nvim_tree_side = 'right'

vim.g.nvim_tree_width = 40

-- Automatically close nvim-tree when it is the last window
vim.g.nvim_tree_auto_close = true

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}

