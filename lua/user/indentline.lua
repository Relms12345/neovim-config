local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.g.indent_blankline_filetype_exclude = {
	"help",
	"packer",
	"NvimTree",
	"Trouble",
	"alpha",
}

indent_blankline.setup({
	show_current_context = true,
})
