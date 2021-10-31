local mod = {};

local path = require('utilities.path');

function mod.configure(initial)
	local packer_ok, packer = pcall(require, 'packer');
	if not packer_ok then
		return
	end

	local packer_config = {
		package_root = path.get_package_path(),
		compile_path = path.get_compile_path(),
		display = {
      open_fn = function()
				local packer_util = require('packer.util');
        return packer_util.float({ border = 'rounded' });
      end,
    },
	}

	packer.init(packer_config);
	packer.startup(function(use)
		use 'wbthomason/packer.nvim';
		use 'nvim-lua/plenary.nvim';
		use 'nvim-treesitter/nvim-treesitter';
		use 'ray-x/lsp_signature.nvim';
		use 'neovim/nvim-lspconfig';
		use 'lewis6991/gitsigns.nvim';
		use 'windwp/nvim-autopairs';
		use 'folke/which-key.nvim';
		use 'ahmedkhalf/project.nvim';
		use 'numToStr/Comment.nvim';

		use {
			'hrsh7th/nvim-cmp',
			requires = {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline'
			}
		};
		use {
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons'
		};

		use 'nvim-telescope/telescope.nvim';
		use {
			'nvim-telescope/telescope-fzf-native.nvim',
			run = 'make'
		};

		if initial then
			packer.sync();
		end
	end);
end

return mod;