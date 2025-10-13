vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<F5>',
  ':wa | :!cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -B build/ && cmake --build build/ -- -j$(nproc)<CR>',
  { noremap = true, silent = true }
)



