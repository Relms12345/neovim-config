local M = {}

local navic = require("nvim-navic")
local gps = require("nvim-gps")

local function is_empty(s)
	return s == nil or s == ""
end

local function get_filename()
	return "%#WinBarFilename#" .. "%t" .. "%*"
end

local function get_location()
	local location = navic.get_location()
	local gps_location = gps.get_location()

	if not is_empty(location) then
		return "%#WinBarContext#" .. " " .. ">" .. " " .. location .. "%*"
	elseif not is_empty(gps_location) then
		return "%#WinBarContext#" .. " " .. ">" .. " " .. gps_location .. "%*"
	else
		return ""
	end
end

local function get_fileicon()
	local hl_winbar_file_icon = "WinBarFileIcon"
	local file_path = vim.fn.expand("%:~:.:h")
	local filename = vim.fn.expand("%:t")
	local file_type = vim.fn.expand("%:e")
	local file_icon = ""
	local file_icon_color = ""

	file_path = file_path:gsub("^%.", "")
	file_path = file_path:gsub("^%/", "")

	if not is_empty(filename) then
		file_icon, file_icon_color =
			require("nvim-web-devicons").get_icon_color(filename, file_type, { default = true })
		vim.api.nvim_set_hl(0, hl_winbar_file_icon, { fg = file_icon_color })
	end

	return "%#WinBarContext#" .. "%#" .. hl_winbar_file_icon .. "#" .. file_icon .. " " .. "%*"
end

function M.get_winbar()
	if navic.is_available() then
		return get_fileicon() .. get_filename() .. get_location()
	else
		return get_fileicon() .. get_filename()
	end
end

return M
