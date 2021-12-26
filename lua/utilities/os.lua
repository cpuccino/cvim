local mod = {};

local fn = vim.fn;

function mod.get_uname()
	return fn.substitute(fn.system('uname'), '\n', '', '')
end

function mod.is_linux()
	return mod.get_uname() == 'Linux';
end

function mod.is_mac()
	return mod.get_uname() == 'Darwin';
end

function mod.is_windows()
	return mod.is_linux() ~= true and mod.is_mac() ~= true;
end

return mod;
