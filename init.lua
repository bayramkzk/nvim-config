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
                    theme = "tokyonight",
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

    -- Language server protocol
    use {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')

            -- Typescript/Javascript language server [typescript-language-server]
            lspconfig.tsserver.setup{}

            -- Python language server [pyright]
            lspconfig.pyright.setup{}

            -- Lua language server [lua-language-server]
            local runtime_path = vim.split(package.path, ';')
            table.insert(runtime_path, "lua/?.lua")
            table.insert(runtime_path, "lua/?/init.lua")

            lspconfig.sumneko_lua.setup {
                cmd = { "/usr/bin/lua-language-server" };
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                            path = runtime_path,
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }

            -- JSON language server [vscode-langservers-extracted]
            lspconfig.jsonls.setup {
                commands = {
                    Format = {
                        function()
                            vim.lsp.buf.range_formatting(
                                {}, {0, 0}, {vim.fn.line("$"), 0}
                            )
                        end
                    }
                }
            }
        end
    }

    use {
        'hrsh7th/nvim-compe',
        config = function()
            vim.o.completeopt = "menuone,noselect"

            -- Setup of compe
            require('compe').setup {
                enabled = true;
                autocomplete = true;
                debug = false;
                min_length = 1;
                preselect = 'enable';
                throttle_time = 80;
                source_timeout = 200;
                incomplete_delay = 400;
                max_abbr_width = 100;
                max_kind_width = 100;
                max_menu_width = 100;
                documentation = {
                    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
                    max_width = 120,
                    min_width = 60,
                    max_height = math.floor(vim.o.lines * 0.3),
                    min_height = 1,
                };

                source = {
                    path = true;
                    buffer = true;
                    calc = true;
                    nvim_lsp = true;
                    nvim_lua = true;
                    spell = true;
                    tags = true;
                    snippets_nvim = true;
                    treesitter = true;
                };
            }

            local function replace_termcode(str)
                return vim.api.nvim_replace_termcodes(str, true, true, true)
            end

            local function check_backspace()
                local col = vim.fn.col('.') - 1
                return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
            end

            function CompeComplete()
                if vim.fn.pumvisible() == 1 then
                    return replace_termcode "<C-n>"
                elseif check_backspace() then
                    return replace_termcode "<Tab>"
                else
                    return vim.fn['compe#complete']()
                end
            end

            function CompeReverseComplete()
                if vim.fn.pumvisible() == 1 then
                    return replace_termcode "<C-p>"
                else
                    return replace_termcode "<S-Tab>"
                end
            end
        end
    }
end)
