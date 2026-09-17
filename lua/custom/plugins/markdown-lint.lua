-- lua/custom/plugins/markdown-lint.lua
local lint = require('lint')
lint.linters.markdownlint.args = {
  '--stdin',
  '-c', vim.fn.stdpath('config') .. '/.markdownlint.json',
}
