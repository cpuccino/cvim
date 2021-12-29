local mod = {};

local content = require('utilities.content');
local symbol = require('configurations.symbol');
local completion = require('configurations.completion');
local fn = vim.fn;

local function map_standard_navigation(cmp)
  return {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-q>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  };
end

local function map_supertab_navigation(cmp)
  return {
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

local function get_confirmation_options(cmp)
  return {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  };
end

local function build_completion_config(cmp)
  local sources = cmp.config.sources(symbol.sources);
  local confirmation_options = get_confirmation_options(cmp);
  local mapping = vim.tbl_extend(
    'force', map_standard_navigation(cmp), map_supertab_navigation(cmp)
  );

  return {
    snippet = completion.snippet,
    mapping = mapping,
    formatting = completion.formatting,
    sources = sources,
    confirm_opts = confirmation_options,
    documentation = completion.documentation
  };
end

function mod.configure()
  local cmp_ok, cmp = pcall(require, 'cmp');
  if not cmp_ok then
    print('Cmp not found.');
    return;
  end

  cmp.setup(build_completion_config(cmp));
end

function mod.load()
  mod.configure();
end

return mod;
