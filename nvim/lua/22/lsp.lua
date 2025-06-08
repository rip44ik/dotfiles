return {
    {
    'neovim/nvim-lspconfig',
     config = function()


local nvim_lsp = require'lspconfig'

-- Настройка клавиш
local opts = { noremap=true, silent=true } -- Параметры для клавиш: не переназначать и не выводить команды

-- Настройка сочетаний клавиш для диагностики
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts) -- Открыть всплывающее окно с диагностикой
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts) -- Перейти к предыдущей диагностике
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts) -- Перейти к следующей диагностике
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts) -- Добавить диагностику в список локализации

-- Функция, вызываемая при подключении языкового сервера
local on_attach = function(client, bufnr)
  -- Включаем автозавершение для текущего буфера
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Настройка сочетаний клавиш для функций LSP
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- Перейти к объявлению
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- Перейти к определению
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts) -- Показать справку
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- Перейти к реализации
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts) -- Показать помощь по сигнатуре
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts) -- Добавить папку в рабочую область
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts) -- Удалить папку из рабочей области
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts) -- Показать список папок рабочей области
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts) -- Перейти к определению типа
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- Переименовать
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- Выполнить действие кода
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) -- Показать ссылки
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts) -- Форматировать код
end

-- Настройка языкового сервера для Go (gopls)
nvim_lsp.gopls.setup ({
  on_attach = on_attach, -- Привязываем функцию on_attach
  flags = {
    debounce_text_changes = 150, -- Устанавливаем задержку для изменений текста
  },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true, -- Включаем динамическую регистрацию для отслеживания изменений файлов
      },
    },
  }
})

-- Настройка обработчика для публикации диагностики
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false -- Отключаем виртуальный текст для диагностики
  }
)
end
}
}
