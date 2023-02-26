local M = {
    "nvim-lualine/lualine.nvim"
}

function M.config()
    require("lualine").setup({
        tabline = {
            lualine_a = { {
                "buffers",
                symbols = {
                    alternate_file = ""
                }
            } }
        },
        options = {
            section_separators = { left = " ", right = " " },
            component_separators = { left = " ", right = " " }
        },
    })
end

return M
