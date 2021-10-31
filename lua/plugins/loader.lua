local mod = {};

local path = require('utilities.path');

function mod.configure(initial)
	local packer_ok, packer = pcall(require, 'packer');
	if not packer_ok then
		return
	end

	-- print('initial: ' .. tostring(initial));
	-- print('package root: ' .. path.get_package_path());
	-- print('compile path: ' .. path.get_compile_path());
	-- print('install path: ' .. path.get_install_path());

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
		use 'neovim/nvim-lspconfig';
		use 'ray-x/lsp_signature.nvim';
		use 'b3nj5m1n/kommentary';

		use({
			'ahmedkhalf/project.nvim',
			config = function() require('project_nvim').setup({}) end;
		});

		use({
			'folke/which-key.nvim',
			config = function() require('which-key').setup({}) end;
		});

		use({
			'windwp/nvim-autopairs',
			config = function() require('nvim-autopairs').setup({}) end
		});

		use({
			'lewis6991/gitsigns.nvim',
			config = function() require('gitsigns').setup({}) end
		});

		use({
			'nvim-treesitter/nvim-treesitter',
			config = function() require('nvim-treesitter').setup({}) end
		});

		use({
			'hrsh7th/nvim-cmp',
			requires = {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline'
			}
		});

		use({
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function() require('nvim-tree').setup({}) end
		});

		use({
			'nvim-telescope/telescope.nvim',
			requires = {
				{
					'nvim-telescope/telescope-fzf-native.nvim',
					run = 'make'
				}
			}
		});

		if initial then
			packer.sync();
		end
	end);
end

return mod;
