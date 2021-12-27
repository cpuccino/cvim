local mod = {};

local path = require('utilities.path');
local loader = require('plugins.loader');

function mod.init()
    local initial_load = path.dir_exists(path.get_install_path()) == false;

    if initial_load then
        local clone_repo_packer_cmd = 'git clone --depth 1 https://github.com/wbthomason/packer.nvim';
        os.execute(clone_repo_packer_cmd .. ' ' .. path.get_install_path());
    end

    loader.configure(initial_load);
end

return mod;
