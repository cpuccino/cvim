local mod = {};

local content = require('utilities.content');
local symbol = require('configurations.symbol');
local fn = vim.fn;

local completion_snippet = {
  expand = function(args)
    fn['vsnip#anonymous'](args.body);
  end
};

local completion_formatting = {
  fields = { 'kind', 'abbr', 'menu' },
  format = function(entry, item)
    item.kind = string.format('%s', symbol.kinds[item.kind]);
    item.menu = symbol.labels[entry.source.name];
    return item;
  end
};

local function get_completion_confirm_options(cmp)
  return {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  };
end

local completion_documentation = {
  border = symbol.borders
};

local function get_completion_mapping(cmp)
  return {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item();
      elseif fn['vsnip#available'](1) == 1 then
        content.feedkey('<Plug>(vsnip-expand-or-jump)', '')
      elseif content.has_words_before() then
        cmp.complete();
      else
        fallback();
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item();
      elseif fn['vsnip#jumpable'](-1) == 1 then
        content.feedkey('<Plug>(vsnip-jump-prev)', '');
      end
    end, { 'i', 's' })
  };
end

function mod.configure()
  local cmp_ok, cmp = pcall(require, 'cmp');
  if not cmp_ok then
    print('Cmp not found.');
    return;
  end

  local cmp_config = {
    snippet = completion_snippet,
    mapping = get_completion_mapping(cmp),
    formatting = completion_formatting,
    sources = cmp.config.sources(symbol.sources),
    confirm_opts = get_completion_confirm_options(cmp),
    documentation = completion_documentation,
  };

  cmp.setup(cmp_config);
end

function mod.load()
  mod.configure();
end

return mod;
