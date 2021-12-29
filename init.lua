local settings = require('settings');
local keybindings = require('keybindings');
local loader = require('loader');
local intellisense = require('intellisense');

local function main()
	settings.load();
	keybindings.load();
	loader.load();
	intellisense.load();
end

main();
