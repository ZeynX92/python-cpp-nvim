-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
        update_root = true,
      },
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 25,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
})


