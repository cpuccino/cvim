local mod = {};

local lsp = require('core.lsp');
local completion = require('core.completion');

function mod.init()
  lsp.load();
  completion.load();
end

return mod;