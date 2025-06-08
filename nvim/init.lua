vim.opt.guifont = "JetBrainsMonoNerdFontMono-Regular:h14"

--загрузка пользовательских команд
require("keymaps")

require("config.lazy")

require("config")

require("autocommands")

--тема
require("tokyonight").load()
