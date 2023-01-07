local PARSERS = {
    "c",
    "cpp",
    "css",
    "html",
    "json",
    "lua",
    "markdown",
    "python",
    "rust",
    "toml",
    "typescript"
}

local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
}

function M.config()
    require("nvim-treesitter.configs").setup({
        ensure_installed = PARSERS,
        sync_install = false,
        auto_install = false,
        highlight = { enable = true },
    })
end

return M
