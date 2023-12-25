local builtin = require('telescope.builtin')
-- For finiding ALL files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- For finiding GIT files only
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

