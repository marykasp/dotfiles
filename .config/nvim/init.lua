local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print('err')
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  "catppuccin/nvim",
  "sainnhe/everforest",
  "nvim-lualine/lualine.nvim",
  "christoomey/vim-tmux-navigator",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "WhoIsSethDaniel/mason-tool-installer.nvim",

  "rmagatti/alternate-toggler",
  "windwp/nvim-autopairs",
  "mg979/vim-visual-multi",
  "gcmt/wildfire.vim",
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "jj" },   -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false,  -- clear line after escaping if there is only whitespace
        keys = "<Esc>",             -- keys used for escaping, if it is a function will use the result everytime
        -- example(recommended)
        -- keys = function()
        --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
        -- end,
      })
    end,
  },
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "onsails/lspkind-nvim",
  "glepnir/lspsaga.nvim",

  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  "jose-elias-alvarez/typescript.nvim",
  "jose-elias-alvarez/null-ls.nvim",

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },
  "nvim-treesitter/nvim-treesitter-context",
  "windwp/nvim-ts-autotag",
  "p00f/nvim-ts-rainbow",
  "axelvc/template-string.nvim",

  "folke/todo-comments.nvim",
  "numToStr/Comment.nvim",
  "akinsho/toggleterm.nvim",

  "tpope/vim-obsession",
  "dhruvasagar/vim-prosession",
  "f-person/git-blame.nvim",
  "github/copilot.vim",

  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  "gbprod/yanky.nvim",

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  }
})

require('base')
require('maps')
require('p-mason')
require('p-null')
require('p-lsp')
require('p-lspsaga')
require('color')
require('text')
require('p-lualine')
require('p-telescope')
require('p-lspkind')
require('p-cmp')
require('p-snip')
require('p-treesitter')
require('other')
require('p-tree')
require('p-yanky')
require('p-comment')
