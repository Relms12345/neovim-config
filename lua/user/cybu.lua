local ok, cybu = pcall(require, "cybu")
if not ok then
	return
end

cybu.setup({
	display_time = 1750, -- time the cybu window is displayed
	style = {
		path = "relative", -- absolute, relative, tail (filename only)
		border = "rounded", -- single, double, rounded, none
		separator = " ", -- string used as separator
		prefix = "…", -- string used as prefix for truncated paths
		padding = 1, -- left & right padding in number of spaces
		hide_buffer_id = true,
		devicons = {
			enabled = true, -- enable or disable web dev icons
			colored = true, -- enable color for web dev icons
		},
	},
})

vim.keymap.set("n", "<s-tab>", "<Plug>(CybuPrev)")
vim.keymap.set("n", "<tab>", "<Plug>(CybuNext)")
vim.keymap.set("n", "<c-i>", "<c-i>")
