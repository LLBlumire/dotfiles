return function()
    require('bufferline').setup({
        options = {
            offsets = { {
                filetype = "NvimTree",
                padding = 1,
            } },
        },
    })
end
