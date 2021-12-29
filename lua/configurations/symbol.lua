local mod = {};

mod.kinds = {
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

mod.labels = {
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

mod.search = {
  prompt_prefix = " ",
  selection_caret = " "
};

mod.borders =  {
  "╭", "─", "╮", "│", "╯", "─", "╰", "│"
};

return mod;