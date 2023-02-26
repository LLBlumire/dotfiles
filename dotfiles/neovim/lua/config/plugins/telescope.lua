local M = {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-ui-select.nvim'
    },
}

function M.config()
    local telescope = require('telescope')
    telescope.setup({
        extensions = {
            ['ui-select'] = {
                require('telescope.themes').get_dropdown()
            }
        }
    })
    telescope.load_extension('file_browser');
    telescope.load_extension('ui-select');
    local telescope_builtin = require('telescope.builtin')
    local telescope_ext = telescope.extensions;

    vim.keymap.set('n', '<leader>\\', telescope_ext.file_browser.file_browser, { desc = "File Tree"} )
    vim.keymap.set('n', '<leader>f', telescope_builtin.find_files, { desc = "Search Files" })
    vim.keymap.set('n', '<leader>sf', telescope_builtin.find_files, { desc = "Files" })
    vim.keymap.set('n', '<leader>sb', telescope_builtin.buffers, { desc = "Buffers" })
    vim.keymap.set('n', '<leader>lr', telescope_builtin.lsp_references, { desc = "References" })
    vim.keymap.set('n', '<leader>ld', telescope_builtin.lsp_definitions, { desc = "Definitions" })
    vim.keymap.set('n', '<leader>li', telescope_builtin.lsp_implementations, { desc = "Implementations" })
    vim.keymap.set('n', '<leader>la', function() vim.lsp.buf.code_action() end, { desc = "Code Actions" })
end

return M
