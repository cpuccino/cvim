local mod = {};

local api = vim.api;

function mod.has_words_before()
  local line, col = unpack(api.nvim_win_get_cursor(0));
  return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil;
end

function mod.feedkey(key, mode)
  api.nvim_feedkeys(api.nvim_replace_termcodes(key, true, true, true), mode, true);
end

return mod;