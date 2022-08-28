return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    --use 'EdenEast/nightfox.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'Mofiqul/dracula.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lualine/lualine.nvim'
    use {'akinsho/bufferline.nvim', tag = "v2.*"}
end)
