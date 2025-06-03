return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fB', builtin.builtin, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Telescope quickfix' })
		vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Telescope grep string' })
		vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Telescope resume' })
		vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Telescope marks' })
	end
}
