vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<F6>', ':Neotree toggle <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle focus <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', ':Neotree float git_status <CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<F3>', ':set number! relativenumber!<CR>', { noremap = true, silent = true })

-- Отключение стрелочных клавиш
vim.api.nvim_set_keymap('', '<up>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<down>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<right>', '', { noremap = true, silent = true })

vim.keymap.set("i", "jj", "<Esc>") -- Аналог для клавишы <Esc>
-- Выключить подсветку найденных объектов. Для поиска используется символ /. n = следующее совпадение, N = предыдущее совпадение
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<Esc>", ":noh<CR>")
