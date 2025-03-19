return {
  -- move lines/blocks with `alt-j/k`
  {
    "fedepujol/move.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("move").setup({})
    end,
  },
}
