local status_ok, discord = pcall(require, "presence")
if not status_ok then
	return
end

discord:setup({})
