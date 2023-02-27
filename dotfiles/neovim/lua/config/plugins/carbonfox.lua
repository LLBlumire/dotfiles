local M = {
    "EdenEast/nightfox.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons"
    }
}

function M.config()
    vim.cmd.highlight("clear")
    vim.cmd.colorscheme("carbonfox")
end

return M
