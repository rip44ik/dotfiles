vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.format(nil, 3000)
  end
})

--Удаление плавающих пробелов на запись:
local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup ('TrimWhiteSpaceGrp', {})
vim.api.nvim_create_autocmd('BufWritePre', {
	group = TrimWhiteSpaceGrp,
  pattern = '*',
  command = '%s/\\s\\+$//e',
})

--Отключить комментирование новой строки (без этой автокоманды, если переходить на новую строку с помощью o или O строка будет закомментирована)
vim.api.nvim_create_autocmd({'BufEnter'}, {
  pattern = '*',
  callback = function()
    vim.opt.fo:remove('c')
    vim.opt.fo:remove('r')
    vim.opt.fo:remove('o')
  end
})

--Сортировка Go импортов на сохранение файла
vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
    params.context = { only = {'source.organizeImports'} }
    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 3000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end,
})
