return {
  {
    "smartpde/neoscopes",
    event = "VeryLazy",
    name = "neoscopes",
    config = function()
      local scopes = require "neoscopes"
      scopes.add_startup_scope()
      scopes.setup {
        scopes = {
          {
            name = "project 1",
            dirs = {},
          },
          {
            name = "project 2",
            dirs = {},
          },
        },
        add_dirs_to_all_scopes = {},
      }
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    init = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                home = "~/notes/home",
              },
            },
          },
        },
      }
    end,
  },
}
