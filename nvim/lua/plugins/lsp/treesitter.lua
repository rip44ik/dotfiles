return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require'nvim-treesitter.configs'.setup{
                -- Список нужных парсеров (первые 7 парсеров обязательно должны быть установлены)
                ensure_installed = { "go", "lua", "vim", "vimdoc", "tsx", "markdown", "markdown_inline", "javascript", "typescript", "vue", "make" },

                -- Способ установки парсеров (синхронный или асинхронный)
                sync_install = false, -- Включаем асинхронную установку парсеров
                -- sync_install = true, -- Включаем синхронную установку парсеров

                -- Автоматически устанавливать недостающие парсеры при входе в буфер
                auto_install = true,

                -- Список парсеров, которые следует игнорировать при установке
                -- ignore_install = { "javascript" },

                -- Настрока подсветки синтаксиса
                highlight = {
                    enable = true, -- Активировать подсветку
                },

                -- Список языков, для которых будут отключена подсветка (указываются названия парсеров, а не тип файла)
                    --disable = { "make" },

                additional_vim_regex_highlighting = true, -- Установите значение true или впишите список ЯП, в которых вы зависите от включения синтаксиса (например, для отступов)
            }
        end,
    },
}
