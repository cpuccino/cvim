local settings = require('settings');
local keybindings = require('keybindings');
local plugin = require('plugin');
local completion = require('completion');
local search = require('search');

local function main()
	settings.load();
	keybindings.load();
	plugin.load();
	completion.load();
	search.load();
end

main();
