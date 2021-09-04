-- Install packer if not installed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd "packadd packer.nvim"
end

-- Autocompile packer in any file change
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

require("packer").startup(
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- File explorer
    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins/nvimtree-cf")
      end
    }

    -- Status line
    use {
      "hoob3rt/lualine.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins/lualine-cf")
      end
    }

    -- Tab line
    use {
      "romgrk/barbar.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins/barbar-cf")
      end
    }

    -- Language server protocol
    use "neovim/nvim-lspconfig"

    -- Install LSP clients easily
    use {
      "kabouzeid/nvim-lspinstall",
      requires = "neovim/nvim-lspconfig",
      config = function()
        require("plugins/lspinstall-cf")
      end
    }

    -- Completion
    use {
      "hrsh7th/nvim-compe",
      config = function()
        require("plugins/nvimcompe-cf")
      end
    }

    -- Lsp pictograms
    use {
      "onsails/lspkind-nvim",
      config = function()
        require("plugins/lspkind-cf")
      end
    }

    -- Snippet support
    use {
      "L3MON4D3/LuaSnip",
      config = function()
        require("plugins/luasnip-cf")
      end
    }

    -- Predefined snippets
    use {
      "rafamadriz/friendly-snippets",
      requires = "L3MON4D3/LuaSnip",
      config = function()
        require("plugins/friendlysnippets-cf")
      end
    }

    -- Treesitter for better syntax highlighting
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("plugins/treesitter-cf")
      end
    }

    -- Better lsp menus
    use {
      "RishabhRD/nvim-lsputils",
      requires = "RishabhRD/popfix",
      config = function()
        require("plugins/lsputils-cf")
      end
    }

    -- Different actions about listing and previewing
    use {
      "nvim-telescope/telescope.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("plugins/telescope-cf")
      end
    }

    -- Auto closing pairs
    use {
      "windwp/nvim-autopairs",
      config = function()
        require("plugins/autopairs-cf")
      end
    }

    -- Auto closing tags
    use {
      "windwp/nvim-ts-autotag",
      config = function()
        require("plugins/autotag-cf")
      end
    }

    -- Git gutter indication
    use {
      "lewis6991/gitsigns.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("plugins/gitsigns-cf")
      end
    }

    -- Comment
    use {
      "terrortylor/nvim-comment",
      config = function()
        require("plugins/comment-cf")
      end
    }

    -- Jumper
    use {
      "phaazon/hop.nvim",
      as = "hop",
      config = function()
        require("plugins/hop-cf")
      end
    }

    -- Indent guides
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("plugins/indentblankline-cf")
      end
    }

    -- Formatter
    use {
      "mhartington/formatter.nvim",
      config = function()
        require("plugins/formatter-cf")
      end
    }

    -- Tokyonight colorscheme
    use {
      "folke/tokyonight.nvim"
    }

    -- Gruvbox colorscheme
    use {
      "ellisonleao/gruvbox.nvim",
      requires = "rktjmp/lush.nvim"
    }
  end
)
