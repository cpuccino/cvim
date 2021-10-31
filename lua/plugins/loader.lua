local mod = {};

local path = require('utilities.path');
local list = require('plugins.list');

function mod.load_plugins(use)
	local plugins = list.get_plugins_list();

	for _, plugin in ipairs(plugins) do
		use(plugin);
	end
end

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
		mod.load_plugins(use);
		if initial then
			packer.sync();
		end
	end);
end

return mod;
