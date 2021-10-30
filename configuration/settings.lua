local function load_settings()
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

    clipboard = 'unnamedplus',
    updatetime = 300,
    errorbells = false
  };

  for key, value in pairs(default_settings) do
    vim.opt[key] = value;
  end

  vim.opt.shortmess:append 'c';
  vim.opt.whichwrap:append '<,>,h,l,[,]';
end

return {
  load_settings = load_settings
};
