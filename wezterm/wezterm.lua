local wezterm = require("wezterm")

--local config = {}
local config = wezterm.config_builder()

--config.font = wezterm.font('JetBrains Mono', { weight = 'Medium' })
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12

-- Установка PowerShell по умолчанию
config.default_prog = { "powershell.exe" }  -- Или "powershell.exe"


-- Настройка сохранения истории
config.scrollback_lines = 10000 -- Устанавливаем размер истории прокрутки
config.disable_default_key_bindings = false
config.enable_scroll_bar = true -- Включаем полосу прокрутки

-- Исправленная настройка для Ctrl+V
config.keys = {
  { key = "v", mods = "CTRL", action = wezterm.action { PasteFrom = "Clipboard" } },
}

config.hide_tab_bar_if_only_one_tab = true

config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

--config.window_decorations = "TITLE | RESIZE"
config.window_decorations = "RESIZE"
--config.window_background_opacity = 0.8

return config


--if wezterm.config_builder then
--  config = wezterm.config_builder()
--end

--config.color_scheme = 'Atelierdune (dark) (terminal.sexy)'
--config.font = wezterm.font('JetBrains Mono', { weight = 'Medium' })



