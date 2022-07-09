local status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
	return
end

local cfg = {
	floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
}

signature.setup(cfg) -- no need to specify bufnr if you don't use toggle_key
signature.on_attach(cfg) -- no need to specify bufnr if you don't use toggle_key
