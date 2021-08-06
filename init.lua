--[[ OPTIONS ]]--
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.mouse = "a"

--[[ THEME ]]--
vim.o.termguicolors = true
vim.cmd[[colorscheme slate]]

--[[ PLUGINS ]]--
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            vim.g.nvim_tree_auto_close = true
            vim.g.nvim_tree_git_hl = true
            vim.g.nvim_tree_icons = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌"
                },
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                lsp = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                }
            }
        end
    }
end)
