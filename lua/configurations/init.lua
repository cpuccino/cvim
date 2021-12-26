local mod = {};

local settings = require('configurations.settings');

function mod.init()
  settings.load_settings();
end

return mod;