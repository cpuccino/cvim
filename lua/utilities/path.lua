local function get_separator()
  return vim.loop.os_uname().version:match('Windows') and '\\' or '/';
end

local function resolve(...)
  return table.concat({ ... }, get_separator());
end

local function exists(path)
  return vim.fn.empty(vim.fn.glob(path)) == 0;
end

local function dir_exists(path)
  return vim.fn.isdirectory(path) == 1;
end

local function file_exists(path)
  return exists(path) and dir_exists(path) ~= true;
end

return {
  resolve = resolve,
  exists = exists,
  dir_exists = dir_exists,
  file_exists = file_exists,
  get_separator = get_separator
};
