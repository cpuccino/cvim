local configurations = require('configurations');
local plugins = require('plugins');

local function main()
	configurations.load();
	plugins.load();
end

main();
