local INSTALL_LSP = {
    "sumneko_lua",
    "pylsp",
    "rust_analyzer",
    "taplo",
    "tsserver",
}

local M = {
    "williamboman/mason.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
        "simrat39/rust-tools.nvim",
        "mfussenegger/nvim-dap",
        "mfussenegger/nvim-lint",
        "mhartington/formatter.nvim",
        "lvimuser/lsp-inlayhints.nvim",
        "j-hui/fidget.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    }
}

function M.config()
    require('mason').setup()
    require('mason-lspconfig').setup({ ensure_installed = INSTALL_LSP })
    require('mason-lspconfig').setup_handlers({
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        ['rust_analyzer'] = function()
            require('rust-tools').setup({
                tools = {
                    inlay_hints = {
                        auto = false
                    }
                },
            })
        end,
        ['sumneko_lua'] = function()
            require('lspconfig').sumneko_lua.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
        end
    })
    require('lsp-inlayhints').setup({})
    vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
    vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
            if not (args.data and args.data.client_id) then
                return
            end
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            require("lsp-inlayhints").on_attach(client, args.buf)
        end,
    })
    require('fidget').setup()
    local cmp = require('cmp')
    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
        }
    })

    local cmd = vim.cmd;

    vim.keymap.set("n", "<leader>cm", function() cmd("Mason") end, { desc = "Mason" })
    vim.keymap.set("n", "<leader>li", function() cmd("LspInfo") end, { desc = "Info" })
    vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, { desc = "Hover" })
    vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, { desc = "LSP Hover Info" })
    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, { desc = "Format" })
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, { desc = "Rename" })

end

return M
