local mod = {};

function mod.load()
	local lsp_installer_ok, lsp_installer = pcall(require, 'nvim-lsp-installer');
	if not lsp_installer_ok then
		return
	end

	lsp_installer.on_server_ready(function (server)
		server:setup({});
	end);
end

return mod;