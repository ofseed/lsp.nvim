vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  root_markers = { '.luarc.json', 'lua/' },
  settings = {
    Lua = {
      hint = {
        enable = true,
        setType = true,
      },
    },
  },
})
