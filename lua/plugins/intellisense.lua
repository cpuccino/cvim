local mod = {};

local fn = vim.fn;

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
      })
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
