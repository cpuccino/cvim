local mod = {};

function mod.load()
  vim.g.nvim_tree_gitignore = 1
  vim.g.nvim_tree_quit_on_open = 0
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_highlight_opened_files = 1
  vim.g.nvim_tree_respect_buf_cwd = 1
  vim.g.nvim_tree_width_allow_resize  = 1
  vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
  };

  vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "",
      staged = "S",
      unmerged = "",
      renamed = "➜",
      deleted = "",
      untracked = "U",
      ignored = "◌",
    },
    folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
    },
  };

	local tree_loaded, tree = pcall(require, 'nvim-tree');
	if not tree_loaded then
		return
	end

  local tree_config = {
    open_on_setup = true,
    view = {
      width = 32,
      auto_resize = true
    },
    filters = {
      dotfiles = true,
      custom = { '.git', '.cache', '.bin' },
    },
  };

  tree.setup(tree_config);
end

return mod;