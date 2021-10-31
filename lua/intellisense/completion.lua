local mod = {};

function mod.load()
	local cmp_ok, cmp = pcall(require, 'cmp');
	if not cmp_ok then
		return
	end

  local cmp_config = {
    sources = {
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
      { name = 'cmdline' }
    },
  }

	cmp.setup(cmp_config);
end

return mod;