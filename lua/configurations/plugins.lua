local mod = {};

local path = require('utilities.path');
local nvim_execute = vim.api.nvim_command;

function mod.setup()
	if path.dir_exists(path.get_install_path()) == false then
		return;
	end

	local clone_repo_packer_cmd = 'git clone --depth 1 https://github.com/wbthomason/packer.nvim';
	os.execute(clone_repo_packer_cmd .. ' ' .. path.get_install_path());
	nvim_execute('packadd packer.nvim');
end

function mod.init()
	mod.setup();
end

return mod;
