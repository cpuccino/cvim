local mod = {};

local path = require('utilities.path');
local loader = require('plugins.loader');

function mod.init()
	local initial_load = path.dir_exists(path.get_install_path()) == false;

	if initial_load then
		local repo_packer = 'git clone --depth 1 https://github.com/wbthomason/packer.nvim';
		os.execute(repo_packer .. ' ' .. path.get_install_path());
	end

	loader.configure(initial_load);
end

return mod;