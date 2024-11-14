# nvim-config

Mostly inspired by theprimeagen and simpler for my preferences.
Here is a list of plugins used for packer...

	 'wbthomason/packer.nvim'
	 'nvim-telescope/telescope.nvim'
	 'folke/tokyonight.nvim'
	 'nvim-tree/nvim-web-devicons' 
	 'nvim-lualine/lualine.nvim'
	 'nvim-tree/nvim-tree.lua'
	 'nvim-treesitter/nvim-treesitter'
	 'VonHeikemen/lsp-zero.nvim'
	 'neovim/nvim-lspconfig'
	 'williamboman/mason.nvim'
	 'williamboman/mason-lspconfig.nvim'
	 'hrsh7th/nvim-cmp'
	 'hrsh7th/cmp-nvim-lsp'
	 'L3MON4D3/LuaSnip'
	 'numToStr/Comment.nvim'

Windows usually puts all nvim stuf in $HOME\AppData\Local\nvim and $HOME\AppData\Local\nvim-data. So be sure to create a nvim-data/site/pack/packer/start/ directory
and then clone the nvim-config and packer.nvim in their respective places.

	cd $HOME\AppData\Local\nvim\
 	git clone https://www.github.com/petesuch/nvim-config
  	mv nvim-config/ nvim/

  	cd $hOME\AppData\Local\nvim-data\site\pack\packer\start
	git clone https://github.com/wbthomason/packer.nvim
 	
 
On Unix/Linux:

	mkdir -p ~/.config/
 	cd ~/.config/ 
 	git clone https://www.github.com/petesuch/nvim-config
  	mv nvim-config/ nvim/


	mkdir -p ~/.local/share/nvim/site/pack/packer/start/

	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 	 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
