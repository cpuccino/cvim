local mod = {};

local path = require('utilities.path');
local opt = vim.opt;

mod.settings = {
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
	timeoutlen = 200,

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

	completeopt = { 'menuone', 'noinsert', 'noselect' },

	undodir = path.get_undo_path(),
	undofile = true,

	clipboard = 'unnamedplus',
	updatetime = 300,
	errorbells = false,

	shortmess = opt.shortmess + 'c',
	whichwrap = opt.whichwrap + '<,>,h,l,[,]',
	iskeyword = opt.iskeyword + '-'
};

return mod;