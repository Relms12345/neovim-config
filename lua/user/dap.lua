local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
	return
end

local vtest_status_ok, vtest = pcall(require, "nvim-dap-virtual-text")
if not vtest_status_ok then
	return
end

dapui.setup()
vtest.setup()
