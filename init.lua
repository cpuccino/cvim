local settings = require('settings');
local keybindings = require('keybindings');
local plugin = require('plugin');
local completion = require('completion');

local function main()
	settings.load();
	keybindings.load();
	plugin.load();
	completion.load();
end

main();
