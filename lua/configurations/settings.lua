local mod = {};

local path = require('utilities.path');

local function get_default_settings()
  local default_settings = {
    autoindent = true,
    autoread = true,

    tabstop = 2,
    shiftwidth = 2,
    expandtab = true,

    backup = false,
    swapfile = false,

    encoding = 'utf-8',
    fileencoding = 'utf-8',

    mouse = 'a',
    ruler = true,
    wrap = false,
    showmode = false,
    foldmethod = 'expr',
    conceallevel = 0,
    pumheight = 10,
    timeoutlen = 150,

    ignorecase = true,
    smartcase = true,

    splitbelow = true,
    splitright = true,

    termguicolors = true,

    scrolloff = 5,
    sidescrolloff = 10,

    number = true,
    relativenumber = true,
    numberwidth = 1,

    spell = false,
    spelllang = 'en_us',

    cursorline = true,
    signcolumn = 'yes',

    title = true,
    incsearch = true,

    completeopt = {
      'menuone',
      'noinsert',
      'noselect'
    },

    undodir = path.get_undo_path(),
    undofile = true,

    clipboard = 'unnamedplus',
    updatetime = 300,
    errorbells = false,

    shortmess = vim.opt.shortmess + 'c',
    whichwrap = vim.opt.whichwrap + '<,>,h,l,[,]',
    iskeyword = vim.opt.iskeyword + '-'
  };

  return default_settings;
end

function mod.load()
  os.execute('mkdir ' .. ' -p ' .. path.get_cache_path());
  
  for key, value in pairs(get_default_settings()) do
    vim.opt[key] = value;
  end
end

return mod;