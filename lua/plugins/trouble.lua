return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({})

    vim.keymap.set("n", "<leader>tt", function()
      require("trouble").toggle()
    end, { desc = "[T]rouble [T]oggle" })

    vim.keymap.set("n", "[d", function()
      require("trouble").previous({ skip_groups = true, jump = true })
    end, { desc = "[T]rouble [P]revious" })

    vim.keymap.set("n", "]d", function()
      require("trouble").next({ skip_groups = true, jump = true })
    end, { desc = "[T]rouble [N]ext" })
  end,
}
