vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'chriskempson/base16-vim'
end)
