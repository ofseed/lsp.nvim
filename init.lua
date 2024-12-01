vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildoptions = 'fuzzy,pum,tagfile'

-- Adjust for 'textDocument/diagnostic'
vim.o.signcolumn = 'yes:1'

-- Enable 'textDocument/inlayHint'
vim.lsp.inlay_hint.enable(true)

-- Enable 'textDocument/foldingRange'
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.lsp.foldexpr()'
vim.o.foldtext = 'v:lua.vim.lsp.foldtext()'
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.api.nvim_create_autocmd('LspNotify', {
  callback = function(args)
    if args.data.method == 'textDocument/didOpen' then
      vim.lsp.foldclose('imports', vim.fn.bufwinid(args.buf))
    end
  end,
})

-- Enable 'textDocument/completion'
vim.o.completeopt = 'menuone,popup,noinsert,fuzzy'
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client_id = args.data.client_id ---@type integer
    vim.lsp.completion.enable(true, client_id, bufnr, {
      autotrigger = true,
    })
    vim.keymap.set('i', '<C-Space>', function()
      vim.lsp.completion.trigger()
    end, { buffer = bufnr, desc = 'Trigger LSP completion' })
  end,
})
