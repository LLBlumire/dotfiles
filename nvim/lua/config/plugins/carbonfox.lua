local M = {
    "EdenEast/nightfox.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons"
    }
}

function M.config()
    local cmd = vim.cmd
    cmd([[highlight clear]])
    cmd([[colorscheme carbonfox]])
end

return M
