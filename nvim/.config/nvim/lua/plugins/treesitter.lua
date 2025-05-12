return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {"lua", "c", "cpp", "cmake", "odin", "javascript", "typescript"},
            highlight = { enable = true },
            indent = { enable = true },
            refactor = {
                highlight_definitions = false,
                highlight_current_scope = false,
            },
        })
    end
}
