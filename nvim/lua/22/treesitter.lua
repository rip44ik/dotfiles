return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Команда для обновления парсеров
    config = function()
require'nvim-treesitter.configs'.setup {
  -- Список имен парсеров или "all" (указанные парсеры ДОЛЖНЫ всегда быть установлены)
  ensure_installed = { "lua", "go", "tsx", "javascript", "typescript", "markdown",  },

  -- Устанавливать парсеры синхронно (применяется только к `ensure_installed`)
  sync_install = false,

  -- Автоматически устанавливать отсутствующие парсеры при входе в буфер
  -- Рекомендация: установите в false, если у вас нет установленного CLI `tree-sitter` локально
  auto_install = true,

  highlight = {
    enable = true, -- Включить подсветку синтаксиса
    },
}
end
}
