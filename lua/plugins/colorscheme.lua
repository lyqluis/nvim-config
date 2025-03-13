return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedarkpro").setup({
        highlights = {
          Folded = {
            -- bg = "#5c6370",  -- default onedark grey
            -- bg = "#394863",
          },
        },
        -- options = {
        --      cursorline = true,
        -- },
      })
    end,
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
