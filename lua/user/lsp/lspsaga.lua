local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	return
end

lspsaga.init_lsp_saga({
	symbol_in_winbar = {
		enable = true,
		separator = " ",
		show_file = true,
		click_support = false,
	},
})
