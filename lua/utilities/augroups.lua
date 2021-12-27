local mod = {};

local nvim_execute = vim.api.nvim_command;

function mod.execute_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		nvim_execute('augroup' .. ' ' .. group_name);
		nvim_execute('autocmd!');
		nvim_execute('autocmd' .. ' ' .. table.concat(definition, ' '));
		nvim_execute('augroup END');
		print('[' .. group_name .. ']' .. ' ' .. 'autocmd has been registered.');
	end
end

return mod;