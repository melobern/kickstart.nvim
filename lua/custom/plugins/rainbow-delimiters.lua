return {
  'HiPhish/rainbow-delimiters.nvim',
  event = 'BufReadPost',
  config = function()
    local rainbow_delimiters = require 'rainbow-delimiters'

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy.global,
        vim = rainbow_delimiters.strategy['local'], -- Utilisation correcte de "local" comme clé
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end,
}
