local opt = vim.opt

-- Установка кодировки
opt.encoding = 'utf-8'

-- Установка языка меню
opt.langmenu = 'ru_RU.UTF-8'

-- Установка языка сообщений
vim.cmd('language messages ru_RU.UTF-8')
    
opt.mouse = "i"  -- Выключить мышь во всех режимах
opt.tabstop = 4           -- Установить количество пробелов для табуляции
opt.shiftwidth = 4        -- Установить количество пробелов для отступа
opt.smartindent = true
opt.expandtab = true      -- Преобразовать табуляцию в пробелы

opt.encoding = 'utf-8'       --Кодировка
opt.showcmd = true           --Отображение команд
opt.swapfile = false         --Не создаем свап файлы
opt.wrap = true              --Длинные линии будет видно

opt.so = 5                   --Отступ курсора от края экрана
opt.foldcolumn = '2'         --Ширина колонки для фолдов
--opt.colorcolumn =  '119'     --Расположение цветной колонки
opt.cursorline = true        -- Подсветка строки с курсором
opt.termguicolors = true
-- Компактный вид у тагбара и Отк. сортировка по имени у тагбара
vim.g.tagbar_compact = 1
vim.g.tagbar_sort = 0
opt.ignorecase = true        --Игнорировать размер букв
opt.smartcase = true         --Игнор прописных букв

-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end
]], false)

--номера строк включены
opt.number = true 
opt.relativenumber = true


-- Буфер обмена
--opt.clipboard = 'unnamed'
opt.clipboard = "unnamedplus"
