local configurations = require('configurations');
local path = require('utilities.path');
local plugins = require('plugins');
local core = require('core');

local function main()
	configurations.init();
	plugins.init();
	core.init();

	-- print(path.exists('/home/cpuccino/'));
	-- print('joined path', path.resolve('path', 'path2'));
	-- print('separators', path.get_separator());
	-- print('dir exists should be true', path.dir_exists('/home/cpuccino'));
	-- print('dir exists should be true', path.dir_exists('/home/cpuccino/.config'));
	-- print('dir exists should be false', path.dir_exists('/home/cpuccino/winehq.key'));
	-- print('file exists should be true', path.file_exists('/home/cpuccino/winehq.key'));
	-- print('file exists should be false', path.file_exists('/home/cpuccino'));
	-- print('cvim init');
end

main();