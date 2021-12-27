local mod = {};

local setup = require('plugins.setup');
local intellisense = require('plugins.intellisense');

function mod.load()
  setup.load();
  intellisense.load();
end

return mod;
