return function()
    local coq = require("coq").lsp_ensure_capabilities({}).capabilities
    require("rust-tools").setup({
        capabilities = coq,
    })
end
