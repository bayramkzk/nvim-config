local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system {'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path}
  vim.api.nvim_command 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'

    -- Statusline
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Colorscheme
    use 'folke/tokyonight.nvim'
end)

