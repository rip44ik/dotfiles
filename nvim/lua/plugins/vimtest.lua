return {
  {
    "vim-test/vim-test",
    config = function()
      -- Настройка стратегии запуска тестов
      vim.g['test#strategy'] = 'neovim' -- Используем встроенный терминал Neovim

      vim.g['test#highlight'] = {
          suite = "Title",
          test = "SpecialComment",
      }
      -- Настройка ключевых сочетаний для запуска тестов
      vim.api.nvim_set_keymap('n', '<leader>tf', ':TestNearest<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tt', ':TestFile<CR>', { noremap = true, silent = true })

      vim.g['test#neovim#start_normal'] = 1
    end,
  },
}
