vim.g.nvim_tree_side = 'right'

vim.g.nvim_tree_width = 40

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

function toggle_tree()
    local view = require('nvim-tree.view')
    local tree = require('nvim-tree')

    if view.win_open() then
        tree.close()
    else
        tree.find_file(true)
    end
end

