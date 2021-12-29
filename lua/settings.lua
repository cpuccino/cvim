local mod = {};

local path = require('utilities.path');
local editor = require('configurations.editor');
local fn = vim.fn;

function mod.setup()
	local create_cache_path_cmd = 'mkdir -p' .. ' ' .. path.get_cache_path();
	fn.system(create_cache_path_cmd);
end

function mod.configure()
	print('Mapping default settings...');
	for key, value in pairs(editor.settings) do
		vim.opt[key] = value;
	end
	print('Successfully mapped default settings.');
end

function mod.load()
	mod.setup();
	mod.configure();
end

return mod;