local mod = {};

local os = require('utilities.os');

local set_keymap = vim.api.nvim_set_keymap;
local options = {noremap = true, silent = true};

local function set_keybindings_leader()
	set_keymap('', '<Space>', '<Nop>', options);
	vim.g.mapleader = " ";
end

local function set_keybindings_window_navigation()
	set_keymap('n', '<C-k>', '<C-w>k', options);
	set_keymap('n', '<C-l>', '<C-w>l', options);
	set_keymap('n', '<C-j>', '<C-w>j', options);
	set_keymap('n', '<C-h>', '<C-w>h', options);
end

local function set_keybindings_window_resize()
	set_keymap('n', '<C-K>', ':resize +2<CR>', options);
	set_keymap('n', '<C-L>', ':vertical resize +2<CR>', options);
	set_keymap('n', '<C-J>', ':resize -2<CR>', options);
	set_keymap('n', '<C-H>', ':vertical resize -2<CR>', options);
end

local function set_keybindings_buffer()
	set_keymap('n', '<Tab-p>', ':bnext<CR>', options);
	set_keymap('n', '<Tab-n>', ':bprevious<CR>', options);
end

local function set_keybindings_explorer()
end

local function set_keybindings_editor()
	set_keymap('i', 'jk', '<Esc>', options);
	set_keymap('v', 'jk', '<Esc>', options);

	set_keymap('v', '<', '<gv', options);
	set_keymap('v', '>', '>gv', options);

	set_keymap('n', 'd', '"_d', options);
	set_keymap('v', 'd', '"_d', options);
	set_keymap('v', 'p', '"_dP', options);

	set_keymap('n', '<M-k>', ':move .-2<CR>==', options);
	set_keymap('n', '<M-j>', ':move .+1<CR>==', options);
	set_keymap('i', '<M-k>', '<Esc>:move .-2<CR>==gi', options);
	set_keymap('i', '<M-j>', '<Esc>:move .+1<CR>==gi', options);
	set_keymap('v', '<M-k>', ':move \'>-2<CR>gv=gv', options);
	set_keymap('v', '<M-j>', ':move \'>+1<CR>gv=gv', options);
end

function mod.load()
	set_keybindings_leader();
	set_keybindings_window_navigation();
	set_keybindings_window_resize();
	set_keybindings_buffer();
	set_keybindings_window_resize();
	set_keybindings_editor();
end

return mod; 