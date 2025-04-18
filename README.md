# nvim-config

Mostly inspired by "ThePrimeagen" but simpler for my meager preferences.
Here is a list of plugins used for packer: Really is a work in progress.
I enjoy going back and forth between editors; sometimes one editor is usefull in one
way and not so usefull in another.
Also keeps you sharp.  

	 'wbthomason/packer.nvim'
	 'nvim-telescope/telescope.nvim'
	 'petesuch/darkpeter.nvim'
	 'nvim-tree/nvim-tree.lua' 
	 'nvim-tree/nvim-web-devicons' 
	 'nvim-lualine/lualine.nvim'
	 'nvim-treesitter/nvim-treesitter'
	 'VonHeikemen/lsp-zero.nvim'
	 'neovim/nvim-lspconfig'
	 'williamboman/mason.nvim'
	 'williamboman/mason-lspconfig.nvim'
	 'hrsh7th/nvim-cmp'
	 'hrsh7th/cmp-nvim-lsp'
	 'L3MON4D3/LuaSnip'
	 'numToStr/Comment.nvim'

On Windows Neovim configuration data gets put in AppData\Local
so follow the advice directly from wbthomason for the packer package directly: 

	git clone https://github.com/petesuch/nvim-config "$env:LOCALAPPDATA\nvim"

	git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
 	
 
On Unix/Linux:

	mkdir -pv ~/.config/
 	cd ~/.config/ 
 	git clone https://www.github.com/petesuch/nvim-config nvim/
  	


	mkdir -pv ~/.local/share/nvim/site/pack/packer/start/

	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 	 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
