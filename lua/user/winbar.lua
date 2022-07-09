local M = {}

local navic = require("nvim-navic")

local function get_buf_option(opt)
	local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
	if not status_ok then
		return nil
	else
		return buf_option
	end
end

local function is_empty(s)
	return s == nil or s == ""
end

M.winbar_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
	"alpha",
	"lir",
	"Outline",
	"spectre_panel",
	"toggleterm",
}

local excludes = function()
	if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
		vim.opt_local.winbar = nil
		return true
	end
	return false
end

local function get_filename()
	return "%#WinBarFilename#" .. "%t" .. "%*"
end

local function get_location()
	local location = navic.get_location()
	if not is_empty(location) then
		return "%#WinBarContext#" .. " " .. ">" .. " " .. location .. "%*"
	end
	return ""
end

function M.get_winbar()
	if excludes() then
		return ""
	end
	if navic.is_available() then
		return get_filename() .. get_location()
	else
		return get_filename()
	end
end

return M
