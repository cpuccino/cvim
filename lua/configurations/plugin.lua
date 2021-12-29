local mod = {};

mod.list = {
	'wbthomason/packer.nvim',
	'nvim-lua/popup.nvim',
	'nvim-lua/plenary.nvim',
	{
		'hrsh7th/nvim-cmp',
		requires = {
			{ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
			{ 'hrsh7th/cmp-path', after = 'nvim-cmp' },
			{ 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
			{
				'hrsh7th/cmp-vsnip',
				after = 'nvim-cmp',
				requires = {
					'hrsh7th/vim-vsnip',
					'rafamadriz/friendly-snippets'
				}
			}
		}
	},
	'nvim-telescope/telescope.nvim'
};

return mod;