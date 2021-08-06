--[[ OPTIONS ]]--
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.mouse = "a"
vim.o.termguicolors = true

--[[ THEME ]]--

--[[ PLUGINS ]]--
vim.cmd 'autocmd BufWritePost init.lua PackerCompile'

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

    -- Status line
    use {
        'hoob3rt/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    colorscheme = "tokyonight",
                    disabled_filetypes = {}
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch'},
                    lualine_c = {{'filename', path = 1}},
                    lualine_x = {'filetype', 'encoding', 'fileformat'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = { "nvim-tree" }
            }
        end
    }

    -- Buffer line
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("bufferline").setup{
                options = {
                    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
                },
                diagnostics = "nvim_lsp"
            }
        end
    }

    -- Colorscheme
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "storm"
            vim.g.tokyonight_italic_keywords = false
            vim.cmd[[colorscheme tokyonight]]
        end
    }
end)
