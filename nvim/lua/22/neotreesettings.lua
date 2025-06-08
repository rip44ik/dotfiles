return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- не обязательно, но рекомендуется
    "MunifTanjim/nui.nvim",
--   " s1n7ax/nvim-window-picker",
    -- "3rd/image.nvim", -- Опциональная поддержка изображений в окне предварительного просмотра: см. `# Режим предварительного просмотра` для получения дополнительной информации
  },

config = function()

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
-- Если вам нужны значки для диагностических ошибок, вам нужно определить их где-то:
 vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "󰌵", texthl = "DiagnosticSignHint"})

	require("neo-tree").setup({})
end
}
