local mod = {};

local settings = require('configurations.settings');
local keybindings = require('configurations.keybindings');

function mod.init()
  settings.load();
  keybindings.load();
end

return mod;