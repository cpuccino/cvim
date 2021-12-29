local mod = {};

local symbol = require('configurations.symbol');
local fn = vim.fn;

mod.snippet = {
  expand = function(args)
    fn['vsnip#anonymous'](args.body);
  end
};

mod.formatting = {
  fields = { 'kind', 'abbr', 'menu' },
  format = function(entry, item)
    item.kind = string.format('%s', symbol.kinds[item.kind]);
    item.menu = symbol.labels[entry.source.name];
    return item;
  end
};

mod.documentation = {
  border = symbol.borders
};

return mod;