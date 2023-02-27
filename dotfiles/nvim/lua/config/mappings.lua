Lastnumber = true
Lastrelativenumber = true

vim.keymap.set("n", "<leader>tn", function()
    local number = vim.opt.number:get()
    local relativenumber = vim.opt.relativenumber:get()
    if number or relativenumber then
        Lastnumber = number
        Lastrelativenumber = relativenumber
        vim.opt.number = false
        vim.opt.relativenumber = false
    else
        vim.opt.number = Lastnumber
        vim.opt.relativenumber = Lastrelativenumber
    end
end, { desc = "Line Numbers" })

vim.keymap.set("n", "<leader>tr", function()
    vim.opt.relativenumber = not (vim.opt.relativenumber:get())
end, { desc = "Relative Numbers" })

vim.keymap.set("n", "<leader>q", function()
    local cmd = vim.cmd
    cmd([[bd]])
end, { desc = "Relative Numbers" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
