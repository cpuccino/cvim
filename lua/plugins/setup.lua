local mod = {};

local path = require('utilities.path');
local augroups = require('utilities.augroups');

local fn = vim.fn;
local nvim_execute = vim.api.nvim_command;

local install_path = path.get_install_path();
local is_bootstrap = path.dir_exists(install_path) == false;

local function reload_settings_on_modify()
	augroups.execute_augroups({
		reload_packer_config = { 'BufWritePost plugins.lua source <afile> | PackerSync' }
	});
end

function mod.setup()
	if is_bootstrap == false then
		print('Packer\'s configured. Skipping bootstrap.')
		return;
	end

	print('Installing packer...');
	local clone_repo_packer_cmd = 'git clone --depth 1 https://github.com/wbthomason/packer.nvim' .. ' ' .. install_path;
	os.execute(clone_repo_packer_cmd);
	nvim_execute('packadd packer.nvim');
	print('Successfully installed packer.')
end

function mod.configure()
	local packer_ok, packer = pcall(require, 'packer')
	if not packer_ok then
		print('Packer not found.')
		return
	end

	packer.init({
		display = {
			open_fn = function()
				local packer_util = require('packer.util');
				return packer_util.float({ border = 'rounded' });
			end,
		},
	});

	return packer.startup(function(use)
		use 'wbthomason/packer.nvim';
		use 'nvim-lua/popup.nvim';
		use 'nvim-lua/plenary.nvim';

		use {
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
		};
		
		if is_bootstrap then
			print('Syncing packer...');
			packer.sync();
			print('Successfully synced packer.');
		end
	end)
end

function mod.post_setup()
	reload_settings_on_modify();
end

function mod.load()
	mod.setup();
	mod.configure();
	mod.post_setup();
end

return mod;
