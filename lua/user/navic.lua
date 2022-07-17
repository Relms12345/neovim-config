local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
	return
end

navic.setup({
	icons = {
		["class-name"] = " ",
		["function-name"] = " ",
		["method-name"] = " ",
		["container-name"] = "⛶ ",
		["tag-name"] = "炙 ",
		["mapping-name"] = " ",
		["sequence-name"] = " ",
		["null-name"] = "[] ",
		["boolean-name"] = "ﰰﰴ ",
		["integer-name"] = "# ",
		["float-name"] = " ",
		["string-name"] = " ",
		["array-name"] = " ",
		["object-name"] = " ",
		["number-name"] = "# ",
		["table-name"] = " ",
		["date-name"] = " ",
		["date-time-name"] = " ",
		["inline-table-name"] = " ",
		["time-name"] = " ",
		["module-name"] = " ",
	},
	highlight = true,
	separator = " > ",
	depth_limit = 0,
	depth_limit_indicator = "..",
})
