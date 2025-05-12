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
                ensure_installed = { "lua_ls", "bashls", "neocmake", "cssls", "dockerls", "docker_compose_language_service", "clangd", "csharp_ls" },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            
            lspconfig.lua_ls.setup({})
            
            lspconfig.clangd.setup({
                cmd = { "clangd", "--compile-commands-dir=." },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = require('lspconfig/util').root_pattern("compile_commands.json", "compile_flags.txt", ".git")
            })

            lspconfig.neocmake.setup({})

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
