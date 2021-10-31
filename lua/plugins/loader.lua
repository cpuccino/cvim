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
		-- Add plugins here

		if initial then
			packer.sync();
		end
	end);
end

return mod;