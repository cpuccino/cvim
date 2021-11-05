local mod = {};

local lsp = require('core.lsp');
local completion = require('core.completion');
local buffer = require('core.buffer');
-- local tree = require('core.tree');

function mod.init()
  lsp.load();
  completion.load();
  buffer.load();
  -- tree.load();
end

return mod;