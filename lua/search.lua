local mod = {};

local symbol = require('configurations.symbol');

local function get_insert_search_mappings(actions)
  return {
    ['C-q'] = actions.close,
    ['<CR>'] = actions.select_default,
    ['<C-u>'] = actions.preview_scrolling_up,
    ['<C-d>'] = actions.preview_scrolling_down,
    ['<C-/>'] = actions.which_key
  };
end

local function get_normal_search_mappings(actions)
  return {
    ['C-q'] = actions.close,
    ['<CR>'] = actions.select_default,
    ['<C-u>'] = actions.preview_scrolling_up,
    ['<C-d>'] = actions.preview_scrolling_down,
    ['gg'] = actions.move_to_top,
    ['G'] = actions.move_to_bottom,
    ['?'] = actions.which_key
  };
end

local function get_search_mappings(actions)
  return {
    mappings = {
      i = get_insert_search_mappings(actions),
      n = get_normal_search_mappings(actions)
    }
  };
end

local function get_search_defaults()
  return vim.tbl_extend(
    'force', symbol.search, { path_display = 'smart' }
  );
end

local function get_search_extensions()
  return {};
end

local function build_search_config(actions)
  return vim.tbl_extend(
    'force',
    get_search_defaults(),
    get_search_mappings(actions),
    get_search_extensions()
  );
end

function mod.configure()
  local telescope_ok, telescope = pcall(require, 'telescope');
  if not telescope_ok then
    print('Telescope not found. Attempting to install...');
    return;
  end

  local telescope_actions_ok, telescope_actions = pcall(require, 'telescope.actions');
  if not telescope_actions_ok then
    print('Telescope actions not found. Attempting to install...');
    return;
  end

  telescope.setup(build_search_config(telescope_actions));
end

function mod.load()
  mod.configure();
end

return mod;