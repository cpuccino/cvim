local mod = {};

function mod.get_plugins_list()
  return {
    'wbthomason/packer.nvim',
    'nvim-lua/plenary.nvim',
    'b3nj5m1n/kommentary',
    {
      'neovim/nvim-lspconfig',
			requires = 'williamboman/nvim-lsp-installer',
		},
    'glepnir/lspsaga.nvim',
    'ray-x/lsp_signature.nvim',
		'kyazdani42/nvim-web-devicons',
		'romgrk/barbar.nvim',
		{
			'nvim-lualine/lualine.nvim',
			config = function() require('lualine').setup({}) end
		},
    {
			'nvim-treesitter/nvim-treesitter',
			config = function() require('nvim-treesitter').setup({}) end
		},
    {
			'hrsh7th/nvim-cmp',
			requires = {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline'
			}
		},
    {
			'ahmedkhalf/project.nvim',
			config = function() require('project_nvim').setup({}) end;
		},
    {
			'nvim-telescope/telescope.nvim',
			requires = {
				{
					'nvim-telescope/telescope-fzf-native.nvim',
					run = 'make'
				}
			}
		},
    {
			'folke/which-key.nvim',
			config = function() require('which-key').setup({}) end;
		},
    {
			'windwp/nvim-autopairs',
			config = function() require('nvim-autopairs').setup({}) end
		},
    {
			'lewis6991/gitsigns.nvim',
			config = function() require('gitsigns').setup({}) end
		},
    {
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function() require('nvim-tree').setup({}) end
		}
  };
end

return mod;
