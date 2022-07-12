local status_ok, lines = pcall(require, "lsp_lines")
if not status_ok then
	return
end

lines.register_lsp_virtual_lines()

vim.diagnostic.config({
	virtual_text = false,
})
