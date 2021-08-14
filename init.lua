--[[ OPTIONS ]]--
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.mouse = "a"
vim.o.termguicolors = true
vim.o.list = true
vim.o.listchars = "tab:› ,trail:-,extends:>,precedes:<,space:·"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false

--[[ PLUGINS ]]--
vim.cmd 'autocmd BufWritePost init.lua PackerCompile'

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            vim.g.nvim_tree_width = 36
            vim.g.nvim_tree_side = "right"
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
                separator_style = "padded_slant",
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

    -- Completion
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

    -- Treesitter for better syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function ()
            require('nvim-treesitter.configs').setup {
                highlight = {
                    enable = true,
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    }

    -- Better lsp menus
    use {
        'RishabhRD/nvim-lsputils',
        requires = 'RishabhRD/popfix',
        config = function ()
            vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
            vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
            vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
            vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
            vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
            vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
            vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
            vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
        end
    }

    -- Different actions about listing and previewing
    use {
      'nvim-telescope/telescope.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function ()
          require('telescope').setup{
              defaults = {
                  vimgrep_arguments = {
                      'rg',
                      '--color=never',
                      '--no-heading',
                      '--with-filename',
                      '--line-number',
                      '--column',
                      '--smart-case'
                  },
                  prompt_prefix = "$ ",
                  selection_caret = "> ",
                  entry_prefix = "  ",
                  initial_mode = "insert",
                  selection_strategy = "reset",
                  sorting_strategy = "descending",
                  layout_strategy = "horizontal",
                  layout_config = {
                      horizontal = {
                          mirror = false,
                      },
                      vertical = {
                          mirror = false,
                      },
                  },
                  file_sorter =  require'telescope.sorters'.get_fuzzy_file,
                  file_ignore_patterns = {},
                  generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
                  winblend = 0,
                  border = {},
                  borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
                  color_devicons = true,
                  use_less = true,
                  path_display = {},
                  set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
                  file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
                  grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
                  qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

                  -- Developer configurations: Not meant for general override
                  buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
              }
        }
      end
    }

    -- Auto closing pairs
    use {
        'windwp/nvim-autopairs',
        config = function ()
            require('nvim-autopairs').setup{}
        end
    }

    -- Auto closing tags
    use {
        'windwp/nvim-ts-autotag',
        config = function ()
            require('nvim-ts-autotag').setup()
        end
    }

    -- Git gutter indication
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function ()
            require('gitsigns').setup {
                current_line_blame = true
            }
        end
    }

    -- Comment
    use {
        "terrortylor/nvim-comment",
        config = function ()
            require('nvim_comment').setup()
        end
    }
end)

--[[ KEYBINDINGS ]]--
vim.g.mapleader = ' '

-- Stop hightlighting search matches
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<CR>', { noremap = true, silent = true })

-- Switch windows easier
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

vim.api.nvim_set_keymap('n', '<LEADER>h', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>j', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>k', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>l', '<C-w>l', { silent = true })

-- Close current tab
vim.api.nvim_set_keymap('n', '<LEADER>w', ':BufferClose<CR>', { noremap = true, silent = true })

-- Switch to next/previous tab
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Move current tab to next/previous
vim.api.nvim_set_keymap('n', '<LEADER>]', ':BufferMoveNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>[', ':BufferMovePrevious<CR>', { noremap = true, silent = true })

-- Jump to tab
vim.api.nvim_set_keymap('n', '<LEADER><TAB>', ':BufferLinePick<CR>', { noremap = true, silent = true })

-- Copy/cut/paste to/from system clipboard
vim.api.nvim_set_keymap('n', '<LEADER>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', '<LEADER>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', '<LEADER>y', '"+yy', { noremap = true })
vim.api.nvim_set_keymap('v', '<LEADER>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<LEADER>d', '"+dd', { noremap = true })
vim.api.nvim_set_keymap('v', '<LEADER>d', '"+d', { noremap = true })
vim.api.nvim_set_keymap('v', '<LEADER>x', '"+x', { noremap = true })

-- Reselect selected lines after incrementing/decrementing indent level
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Toggle nvim-tree
vim.api.nvim_set_keymap('n', '<LEADER>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- LSP
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>r', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>a', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<LEADER>a', ':lua vim.lsp.buf.range_code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>f', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<LEADER>f', ':lua vim.lsp.buf.range_formatting()<CR>', { noremap = true, silent = true })

-- Completion
vim.api.nvim_set_keymap("i", "<TAB>", "v:lua.CompeComplete()", { expr = true })
vim.api.nvim_set_keymap("s", "<TAB>", "v:lua.CompeComplete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-TAB>", "v:lua.CompeReverseComplete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-TAB>", "v:lua.CompeReverseComplete()", { expr = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<LEADER><LEADER>", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LEADER>gc", ":Telescope git_commits<CR>", { noremap = true, silent = true })
