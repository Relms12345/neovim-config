local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
	return
end

local vtext_status_ok, vtext = pcall(require, "nvim-dap-virtual-text")
if not vtext_status_ok then
	return
end

dapui.setup()
vtext.setup()
