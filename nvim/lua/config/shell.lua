if vim.fn.has('win64') then
    vim.opt.shell = 'pwsh'
else
    local osenv = os.getenv("SHELL")
    if osenv == nil then
        vim.opt.shell = 'sh'
    end
    vim.opt.shell = osenv
end
