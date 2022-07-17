local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then
	return
end

gps.setup({
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
	separator = " > ",
	depth = 0,
	depth_limit_indicator = "..",
})
