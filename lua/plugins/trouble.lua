return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({})

    vim.keymap.set("n", "<leader>tt", function()
      require("trouble").toggle()
    end, { desc = "[T]rouble [T]oggle" })
  end,
}
