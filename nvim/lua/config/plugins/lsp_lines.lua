local M = {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    name = "lsp_lines.nvim"
}

function M.config()
    require('lsp_lines').setup()
    vim.diagnostic.config({virtual_text = false})
end

return M
