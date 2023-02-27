local M = {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    }
}

function M.config()
    require("telescope").load_extension("harpoon")
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    local term = require("harpoon.term")
    vim.keymap.set("n", "<leader>ha", function()
        mark.add_file()
    end, { desc = "Add Mark" })
    vim.keymap.set("n", "<leader>hl", function()
        ui.toggle_quick_menu()
    end, { desc = "List Marks" })
    vim.keymap.set("n", "<M-1>", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<M-2>", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<M-3>", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<M-4>", function() ui.nav_file(4) end)
    vim.keymap.set("n", "<M-!>", function() term.gotoTerminal(1) end)
    vim.keymap.set("n", '<M-">', function() term.gotoTerminal(2) end)
    vim.keymap.set("n", "<M-£>", function() term.gotoTerminal(3) end)
    vim.keymap.set("n", "<M-$>", function() term.gotoTerminal(4) end)
end

return M
