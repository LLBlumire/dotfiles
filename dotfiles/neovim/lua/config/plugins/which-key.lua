local GROUPS = {
    ["s"] = { name = "+Search" },
    ["l"] = { name = "+LSP" },
    ["t"] = { name = "+Toggle" },
    ["c"] = { name = "+Configure" },
    ["h"] = { name = "+Harpoon" },
}

local M = {
    "folke/which-key.nvim"
}

function M.config()
    local wk = require("which-key");
    wk.setup()
    wk.register(GROUPS, { prefix = "<leader>" })
end

return M
