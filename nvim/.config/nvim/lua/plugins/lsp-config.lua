return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "bashls", "neocmake", "cssls", "dockerls", "docker_compose_language_service", "clangd", "csharp_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        end
    }
}
