local mod = {};
local buffer_keybindings = require('keybindings.buffer');

function mod.load()
  buffer_keybindings.load();
end

return mod;