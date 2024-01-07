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
    opts = {
      char = "┊",
      show_trailing_blankline_indent = false,
    },
  },

  {
    "numToStr/Comment.nvim",
    config = true,
  },
}
