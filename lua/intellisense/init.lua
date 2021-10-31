local mod = {};

local lsp = require('intellisense.lsp');
local completion = require('intellisense.completion');

function mod.init()
  lsp.load();
  completion.load();
end

return mod;