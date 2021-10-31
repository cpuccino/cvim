local mod = {};

local path = require('utilities.path');
local settings = require('configuration.settings');

function mod.init()
  os.execute('mkdir ' .. path.get_cache_path() .. ' -p');
  settings.load_settings();
end

return mod;