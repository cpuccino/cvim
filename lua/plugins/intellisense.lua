local mod = {};

local fn = vim.fn;
local api = vim.api;

local has_words_before = function()
  local line, col = unpack(api.nvim_win_get_cursor(0))
  return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local feedkey = function(key, mode)
  api.nvim_feedkeys(api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

function mod.configure()
  local cmp_ok, cmp = pcall(require, 'cmp');
  if not cmp_ok then
    print('Cmp not found.');
    return;
  end

  local cmp_config = {
    snippet = {
      expand = function(args)
        fn['vsnip#anonymous'](args.body);
      end,
    },
    mapping = {
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
          feedkey('<Plug>(vsnip-expand-or-jump)', '')
        elseif has_words_before() then
          cmp.complete();
        else
          fallback();
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item();
        elseif fn['vsnip#jumpable'](-1) == 1 then
          feedkey('<Plug>(vsnip-jump-prev)', '');
        end
      end, { 'i', 's' })
    },
    sources = cmp.config.sources({
      { name = 'buffer' },
      { name = "path" },
      { name = 'cmdline' },
      { name = 'vsnip' }
    }),
  };

  cmp.setup(cmp_config);
end

function mod.load()
  mod.configure();
end

return mod;