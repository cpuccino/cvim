local mod = {};

local loader = require('plugins.loader');
local intellisense = require('plugins.intellisense');

function mod.load()
  loader.load();
  intellisense.load();
end

return mod;
