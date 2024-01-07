return {
  "tpope/vim-sleuth",

  {
    "LiamFenneman/quick-run.nvim",
    opts = {
      mappings = {
        quick_run = "<F5>",
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "┊" },
      scope = { enabled = false },
    },
  },

  {
    "numToStr/Comment.nvim",
    config = true,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({})

      vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next()
      end, { desc = "Next TODO comment" })

      vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev()
      end, { desc = "Previous TODO comment" })

      vim.keymap.set("n", "<leader>st", ":TodoTelescope<CR>", { desc = "[S]earch [T]ODO comments" })
      vim.keymap.set("n", "<leader>td", ":TodoTrouble<CR>", { desc = "Open [T]ODO [T]rouble" })
    end
  },
}
