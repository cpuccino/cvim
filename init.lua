local settings = require('settings');
local keybindings = require('keybindings');
local loader = require('loader');
local completion = require('completion');

local function main()
	settings.load();
	keybindings.load();
	loader.load();
	completion.load();
end

main();
