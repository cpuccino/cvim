local mod = {};

mod.kind_icons = {
  Text = '',
  Method = 'm',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = ''
};

mod.menu_label = {
  nvim_lsp = '[LSP]',
  vsnip = '[Snippet]',
  buffer = '[Buffer]',
  path = '[Path]'
};

mod.sources = {
  { name = 'nvim_lsp' },
  { name = 'vsnip' },
  { name = 'buffer' },
  { name = 'path' }
};

mod.rounded_border =  { 
  "╭", "─", "╮", "│", "╯", "─", "╰", "│" 
};

return mod;