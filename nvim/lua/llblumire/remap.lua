-- Specifies personal configuration for key remaps, this generally follow the
-- format of <leader> <namespace> <command>.
--
-- |> c <| Configuration namespace
-- |> cn <| Toggle numbering
-- |> cN <| Toggle relative numbering
-- |> cc <| Toggle color columns
-- |> cl <| Toggle lsp lines
-- |> cf <| Toggle file browser
-- |> cz <| Toggle zen mode
--
-- |> t <| Telescope
-- |> tf <| File picker
-- |> tb <| Buffer picker
-- |> tt <| Treesitter token picker
-- |> tg <| Grep picker
-- |> ta <| Code actions
-- |> te <| Diagnostics
--
-- |> g <| Goto, navigation
-- |> ge <| Next diagnostic
-- |> gE <| Previous diagnostic
-- |> gd <| Definition
-- |> gD <| Declaration
-- |> gi <| Implementation
-- |> gr <| References
--
-- |> i <| Info, metadata
-- |> ih <| Hover, LSP
-- |> ie <| Diagnostics, LSP
-- 
-- |> e <| Edit actions
-- |> en <| Change name, rename action

local keymap = require("llblumire.keymap")

keymap.nnoremap("<leader>cn", function()
	local number = vim.opt.number:get()
	local relnu = vim.opt.relativenumber:get()

	if number then
		OldRelnu = relnu
		vim.opt.relativenumber = false
	else
		vim.opt.relativenumber = OldRelnu
	end

	vim.opt.number = not number
end)

keymap.nnoremap("<leader>cN", function()
	vim.opt.relativenumber = not (vim.opt.relativenumber:get())
end)
keymap.nnoremap("<leader>cc", function()
	local current_cc = vim.opt.colorcolumn:get()
	if current_cc[1] == nil then
		vim.opt.colorcolumn = OldCc
	else
		OldCc = current_cc
		vim.opt.colorcolumn = {}
	end
end)
keymap.nnoremap("<leader>cl", function() require("lsp_lines").toggle() end)
keymap.nnoremap("<leader>cf", function() require("nvim-tree").toggle() end)
keymap.nnoremap("<leader>cz", function() require("true-zen").ataraxis() end)

local telescope_builtin = require("telescope.builtin")
local tb_loaded, tb = pcall(require, "telescope.builtin");
if tb_loaded then
    keymap.nnoremap("<leader>tf", tb.find_files)
    keymap.nnoremap("<leader>tb", tb.buffers)
    keymap.nnoremap("<leader>tt", tb.treesitter)
    keymap.nnoremap("<leader>tg", tb.live_grep)
    keymap.nnoremap("<leader>te", tb.diagnostics)
end
keymap.nnoremap("<leader>ta", vim.lsp.buf.code_action)

keymap.nnoremap("<leader>ge", vim.diagnostic.goto_next)
keymap.nnoremap("<leader>gE", vim.diagnostic.goto_prev)
keymap.nnoremap("<leader>gD", vim.lsp.buf.declaration)
if tb_loaded then
    keymap.nnoremap("<leader>gd", telescope_builtin.lsp_definitions)
    keymap.nnoremap("<leader>gi", telescope_builtin.lsp_implementations)
    keymap.nnoremap("<leader>gr", telescope_builtin.lsp_references)
end

keymap.nnoremap("<leader>ih", vim.lsp.buf.hover)
keymap.nnoremap("<leader>ie", vim.diagnostic.open_float)

keymap.nnoremap("<leader>en", vim.lsp.buf.rename)
