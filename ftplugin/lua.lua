vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.lsp.start({
  name = 'lua_ls',
  cmd = { 'lua-language-server' },
  root_dir = vim.fs.root(0, { '.git/', '.luarc.json', 'lua/' }),
  settings = {
    Lua = {
      hint = {
        enable = true,
        setType = true,
      },
    },
  },
})
