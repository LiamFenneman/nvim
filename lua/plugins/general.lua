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
    },
  },

  {
    "numToStr/Comment.nvim",
    config = true,
  },
}
