-- autosave.lua
vim.pack.add({
  'https://github.com/okuuva/auto-save.nvim',
})
require('auto-save').setup {
  enabled = true,
  trigger_events = {
    immediate_save = { 'BufLeave', 'FocusLost' },
    defer_save = { 'InsertLeave', 'TextChanged' },
    cancel_deferred_save = { 'InsertEnter' },
  },
  write_all_buffers = false,
  debounce_delay = 1000,
  hooks = {
    post_write = function()
      local filename = vim.fn.expand '%:p'
      vim.notify('AutoSave: ' .. filename .. ' at ' .. vim.fn.strftime '%H:%M:%S')
    end,
  },
}
vim.keymap.set('n', '<leader>n', '<cmd>ASToggle<CR>', { desc = 'Toggle auto-save' })

-- return {
--   'okuuva/auto-save.nvim',
--   cmd = 'ASToggle',
--   event = { 'InsertLeave', 'TextChanged' },
--   opts = {
--     enabled = true,
--     -- execution_message = {
--     --   enabled = true,
--     --   message = function()
--     --     return ('AutoSave: ' .. vim.fn.strftime '%H:%M:%S')
--     --   end,
--     --   dim = 0.18,
--     --   cleaning_interval = 1250,
--     -- },
--     trigger_events = {
--       immediate_save = { 'BufLeave', 'FocusLost' },
--       defer_save = { 'InsertLeave', 'TextChanged' },
--       cancel_deferred_save = { 'InsertEnter' },
--     },
--     write_all_buffers = false,
--     debounce_delay = 1000,
--     hooks = {
--       post_write = function()
--         local filename = vim.fn.expand '%:p'
--         vim.notify('AutoSave: ' .. filename .. ' at ' .. vim.fn.strftime '%H:%M:%S')
--       end,
--     },
--   },
--   keys = {
--     { '<leader>n', '<cmd>ASToggle<CR>', desc = 'Toggle auto-save' },
--   },
-- }
