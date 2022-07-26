local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

mason.setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
})

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
})

require("user.lsp.settings.sumneko_lua")
require("user.lsp.settings.jsonls")
require("user.lsp.settings.tsserver")
require("user.lsp.settings.yamlls")
require("user.lsp.settings.volar")
require("user.lsp.settings.dockerls")
require("user.lsp.settings.rnix")
require("user.lsp.settings.taplo")
