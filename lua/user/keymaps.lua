local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope frecency<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fe", ":Telescope emoji<CR>", opts)
keymap("n", "<leader>fp", ":Telescope project<CR>", opts)
keymap("n", "<leader>fd", ":Telescope dap commands<CR>", opts)

-- Comment
keymap("n", "<leader>/", ":lua require('Comment').toggle()<CR>", opts)

-- Nvim-Tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Trouble
keymap("n", "<leader>xx", ":Trouble<CR>", opts)
keymap("n", "<leader>xw", ":Trouble workspace_diagnostics<CR>", opts)
keymap("n", "<leader>xd", ":Trouble document_diagnostics<CR>", opts)
keymap("n", "<leader>xl", ":Trouble loclist<CR>", opts)
keymap("n", "<leader>xq", ":Trouble quickfix<CR>", opts)

-- DAP
keymap("n", "<F4>", ":lua require('dapui').toggle()<CR>", opts)
keymap("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<F9>", ":lua require('dap').continue()<CR>", opts)
keymap("n", "<F1>", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<F2>", ":lua require('dap').step_into()<CR>", opts)
keymap("n", "<F3>", ":lua require('dap').step_out()<CR>", opts)
keymap("n", "<leader>dsc", ":lua require('dap').continue()<CR>", opts)
keymap("n", "<leader>dsv", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<leader>dsi", ":lua require('dap').step_into()<CR>", opts)
keymap("n", "<leader>dso", ":lua require('dap').step_out()<CR>", opts)
keymap("n", "<leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", opts)
keymap("v", "<leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>", opts)
keymap("n", "<leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", opts)
keymap(
	"n",
	"<leader>duf",
	":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>",
	opts
)
keymap("n", "<leader>dro", ":lua require('dap').repl.open()<CR>", opts)
keymap("n", "<leader>drl", ":lua require('dap').repl.run_last()<CR>", opts)
keymap("n", "<leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap(
	"n",
	"<leader>dbm",
	":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
	opts
)
keymap("n", "<leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", opts)
keymap("n", "<leader>di", ":lua require('dapui').toggle()<CR>", opts)

-- Spectre
keymap("n", "<leader>S", ":lua require('spectre').open()<CR>", opts)
keymap("n", "<leader>sw", ":lua require('spectre').open_visual({select_word=true})<CR>", opts)
keymap("n", "<leader>s", ":lua require('spectre').open_visual()<CR>", opts)
keymap("n", "<leader>sp", ":lua require('spectre').open_file_search()<CR>", opts)

-- Insert --

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Comment
keymap("v", "<leader>/", ':lua require("Comment.api").gc(vim.fn.visualmode())<CR>', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
