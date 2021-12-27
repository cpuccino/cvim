local mod = {};

local settings = require('configurations.settings');
local keybindings = require('configurations.keybindings');
local plugins = require('configurations.plugins');

function mod.init()
	settings.load();
	keybindings.load();
	plugins.load();
end

return mod;
