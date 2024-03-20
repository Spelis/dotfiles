local vim = vim


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	dir = "~/Documents/Lua/nvSidebar",
	"folke/trouble.nvim",
	'lewis6991/satellite.nvim',
	"folke/which-key.nvim",
	"folke/neodev.nvim",
	'rcarriga/nvim-notify',
	'nvim-treesitter/nvim-treesitter',
	'neovim/nvim-lspconfig',
	'hrsh7th/nvim-cmp',
	"L3MON4D3/LuaSnip",
	'saadparwaiz1/cmp_luasnip',
	'nvim-tree/nvim-tree.lua',
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"glepnir/lspsaga.nvim",
	"jose-elias-alvarez/typescript.nvim",
	"onsails/lspkind.nvim",
	"nvim-tree/nvim-web-devicons",
	'stevearc/conform.nvim',
	"nvim-treesitter/nvim-treesitter",
	"rafamadriz/friendly-snippets",
	"nvim-telescope/telescope.nvim",
	"nvim-lua/plenary.nvim",
	"mawkler/modicator.nvim",
	{
		'aurum77/live-server.nvim',
		cmd = { 'LiveServerStart', 'LiveServerStop' },
	},
	{
		'Bekaboo/dropbar.nvim',
		-- optional, but required for fuzzy finder support
		dependencies = {
			'nvim-telescope/telescope-fzf-native.nvim'
		}
	},
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = {
			'smoka7/hydra.nvim',
		},
		opts = {},
		cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
		keys = {
			{
				mode = { 'v', 'n' },
				'<Leader>m',
				'<cmd>MCstart<cr>',
				desc = 'Create a selection for selected text or word under the cursor',
			},
		},
	},
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				-- config
			}
		end,
		dependencies = { { 'nvim-tree/nvim-web-devicons' } }
	},
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},
	{ 'numToStr/Comment.nvim',     lazy = false, },
	{ 'windwp/nvim-autopairs',     event = "InsertEnter",                           opts = {} },
	{ "folke/tokyonight.nvim",     lazy = false,                                    priority = 1000, opts = {}, },
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
})
require('keybindings')

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'filetype' },
		lualine_y = { 'os.date("%X")' },
		lualine_z = { 'os.date("%x")' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.api.nvim_buf_set_keymap(bufnr, "n", keys, "<cmd>" .. func .. "<cr>",
			{ noremap = true, silent = true, desc = desc })
	end

	-- Define your key mappings here
end

require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	ensure_installed = { "lua_ls", "cssls", "html", "pyright", "jsonls" },
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
})

require('lspconfig').pyright.setup { on_attach = on_attach, settings = { pyright = { autoImportCompletion = true, }, python = { analysis = { autoSearchPaths = true, diagnosticMode = 'openFilesOnly', useLibraryCodeForTypes = true, typeCheckingMode = 'off' } } } }

local cmp = require('cmp')
cmp.setup({
	confirmation = {
		completeopt = 'menu,menuone,noinsert'
	},
	mapping = {
		['<Up>'] = cmp.mapping.select_prev_item(),
		['<Down>'] = cmp.mapping.select_next_item(),
		['<C-e>'] = cmp.mapping.close(),
		['<Tab>'] = cmp.mapping.confirm({ select = true })
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'luasnip' }
	},
	snippet = {
		expand = function(args)
			require 'luasnip'.lsp_expand(args.body)
		end,
	},
})
require("luasnip.loaders.from_vscode").lazy_load()
require('Comment').setup({
	toggler = {
		line = ' cc',
		block = nil,
	},
	extra = {
		above = nil,
		below = nil,
		eol = ' ce',
	},
})
require("conform").setup({
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
require('nvim-tree').setup()
require('satellite').setup()
require("which-key").setup()
require "live_server.util".install()






vim.cmd('colorscheme tokyonight-night')
vim.cmd('set cursorline')
vim.cmd('set number')
require("modicator").setup()
