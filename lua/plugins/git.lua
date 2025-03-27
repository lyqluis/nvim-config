return {
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      vim.cmd.cnoreabbrev([[git Git]]) -- alias :Git to :git
    end,
  },
}
