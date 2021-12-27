local mod = {};

local path = require('utilities.path');
local augroups = require('utilities.augroups');

local fn = vim.fn;
local nvim_execute = vim.api.nvim_command;

local install_path = path.get_install_path();
local is_bootstrap = path.dir_exists(install_path) == false;

local function reload_settings_on_modify()
	augroups.execute_augroups({
		reload_packer_config = {'BufWritePost plugins.lua source <afile> | PackerSync'}
	});
end

function mod.install()
end

function mod.load()
	if is_bootstrap then
		local clone_repo_packer_cmd = 'git clone --depth 1 https://github.com/wbthomason/packer.nvim';
		fn.system(clone_repo_packer_cmd .. ' ' .. install_path);
		nvim_execute('packadd packer.nvim');
	end

	reload_settings_on_modify();

	local packer_ok, packer = pcall(require, 'packer')
	if not packer_ok then
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
		
		if is_bootstrap then
			packer.sync()
		end
	end)
end

return mod;