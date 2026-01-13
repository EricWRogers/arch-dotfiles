return {
  {
    "neovim/nvim-lspconfig", -- make sure the plugin is declared
    config = function()
      -- Capabilities (completion, etc.)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lua LS (correct name is lua_ls)
      vim.lsp.config["lua_ls"] = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
          },
        },
        capabilities = capabilities,
      },
      vim.lsp.enable("lua_ls")

      -- Clangd
      vim.lsp.config["clangd"] = {
        cmd = { "clangd", "--compile-commands-dir=." },
        filetypes = { "c", "h", "cpp", "hpp", "objc", "objcpp" },
        root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
        capabilities = capabilities,
      },
      vim.lsp.enable("clangd")

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
}

