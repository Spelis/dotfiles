vim.g.mapleader = ' '
local wk = require 'which-key'
local map = vim.keymap.set

-- map(' ff', ':Telescope<CR>')
-- map(' wr', ':TroubleToggle<CR>')
-- map(' wt', ':NvimTreeToggle<CR>')
-- map(' ul', ':Lazy<CR>')

wk.register({
	f = {
		name = 'File',
		f = { ":Telescope find_files<CR>", "Find File" },
		r = { ":Telescope oldfiles<CR>", "Open Recent File" },
	},
	w = {
		name = 'Window',
		r = { ':TroubleToggle<CR>', "Toggle Error Pane" },
		e = { ':NvimTreeToggle<CR>', "Toggle File Tree Pane" },
		t = { ':botright terminal<CR>i', "Open Terminal" },
		s = {
			name = 'Resize',
			e = { '<C-w>=', 'Set Equal' },
			w = { '<C-w>+', 'Set Equal' },
			s = { '<C-w>-', 'Set Equal' },
		}
	},
	u = {
		name = 'Unusual',
		l = { ":Lazy<CR>", "Open Lazy" },
	},
	t = {
		name = 'Tabs',
		q = { ':q<CR>', 'Close Tab' },
		t = { ':tabNext<CR>', 'Next Tab' },
		n = { ':tabnew ', 'New Tab' }
	},
	c = {
		name = 'Comment'
	}
}, { prefix = " " })

map('i', '<C-z>', '<ESC>ui', {})
map('n', '<C-z>', '<ESC>u', {})
map('v', '<C-z>', '<ESC>uv', {})
