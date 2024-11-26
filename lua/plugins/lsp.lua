return {
  {  -- https://github.com/williamboman/mason.nvim
    "williamboman/mason.nvim",
    -- event = 'VeryLazy',
    cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
    config = function()
      require('mason').setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = 'VeryLazy',
  },
  {
    "neovim/nvim-lspconfig",
    event = 'VeryLazy',
  }
}

