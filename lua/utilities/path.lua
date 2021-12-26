local mod = {};

local os = require('utilities.os');
local fn = vim.fn;

function mod.get_separator()
  return os.is_windows() and '\\' or '/';
end

function mod.resolve(...)
  return table.concat({ ... }, mod.get_separator());
end

function mod.exists(path)
  return fn.empty(fn.glob(path)) == 0;
end

function mod.dir_exists(path)
  return fn.isdirectory(path) == 1;
end

function mod.file_exists(path)
  return mod.exists(path) and mod.dir_exists(path) ~= true;
end

function mod.get_package_path()
  return mod.resolve(fn.stdpath('data'), 'site', 'pack');
end

function mod.get_install_path()
  return mod.resolve(mod.get_package_path(), 'packer', 'start', 'packer.nvim');
end

function mod.get_compile_path()
  return mod.resolve(fn.stdpath('config'), 'plugin', 'packer.compiled.lua');
end

function mod.get_cache_path()
  return mod.resolve(fn.stdpath('cache'));
end

function mod.get_undo_path()
  return mod.resolve(mod.get_cache_path(), 'undodir');
end;

return mod;