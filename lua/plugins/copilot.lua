return {
  {
    'zbirenbaum/copilot.lua',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
    config = true,
    cond = function() return vim.g.copilot end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = true,
  },
}
