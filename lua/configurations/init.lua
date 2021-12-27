local mod = {};

local settings = require('configurations.settings');
local keybindings = require('configurations.keybindings');

function mod.load()
	settings.load();
	keybindings.load();
end

return mod;
