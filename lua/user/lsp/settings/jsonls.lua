local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local schemastore_status_ok, schemastore = pcall(require, "schemastore")
if not schemastore_status_ok then
	return
end

lspconfig.jsonls.setup({
	settings = {
		json = {
			schemas = schemastore.json.schemas(),
			validate = { enable = true },
		},
	},
})
