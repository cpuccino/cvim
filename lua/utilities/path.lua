local mod = {};

function mod.get_separator()
  return vim.loop.os_uname().version:match('Windows') and '\\' or '/';
end

function mod.resolve(...)
  return table.concat({ ... }, mod.get_separator());
end

function mod.exists(path)
  return vim.fn.empty(vim.fn.glob(path)) == 0;
end

function mod.dir_exists(path)
  return vim.fn.isdirectory(path) == 1;
end

function mod.file_exists(path)
  return mod.exists(path) and mod.dir_exists(path) ~= true;
end

function mod.get_package_path()
  return mod.resolve(vim.fn.stdpath('data'), 'site', 'pack');
end

function mod.get_install_path()
  return mod.resolve(mod.get_package_path(), 'packer', 'start', 'packer');
end

function mod.get_compile_path()
  return mod.resolve(vim.fn.stdpath('config'), 'plugin', 'packer.compiled.lua');
end

function mod.get_cache_path()
  return mod.resolve(vim.fn.stdpath('cache'));
end

function mod.get_undo_path()
  return mod.resolve(mod.get_cache_path(), 'undodir');
end;

return mod;