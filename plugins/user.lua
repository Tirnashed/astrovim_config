return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "Tirnashed/neoscopes",
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
            glob_pattern = {},
            additional_args = {},
          },
          {
            name = "project 2",
            dirs = {},
            glob_pattern = {},
            additional_args = {},
          },
        },
        add_dirs_to_all_scopes = {},
      }
    end,
    keys = {
      {
        "<leader>ss",
        mode = { "n" },
        function() require("neoscopes").select() end,
        desc = "Select Scope",
      },
      {
        "<leader>sg",
        mode = { "n" },
        function() require("neoscopes").live_grep() end,
        desc = "Live Grep in Scope",
      },
      {
        "<leader>sf",
        mode = { "n" },
        function() require("neoscopes").find_files() end,
        desc = "Find Files in Scope",
      },
      {
        "<leader>sc",
        mode = { "n" },
        function() require("neoscopes").grep_string() end,
        desc = "Grep String in Scope",
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
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
    keys = {
      { "<leader>wh", mode = { "n" }, "<cmd>Neorg workspace home<cr>", desc = "Go to home workspace" },
      { "<leader>wt", mode = { "n" }, "<cmd>Neorg toggle-concealer<cr>", desc = "Toggle concealer" },
      { "<leader>w0", mode = { "n" }, "<cmd>set conceallevel=0<cr>", desc = "Set conceal level 0" },
      { "<leader>w1", mode = { "n" }, "<cmd>set conceallevel=1<cr>", desc = "Set conceal level 1" },
      { "<leader>w2", mode = { "n" }, "<cmd>set conceallevel=2<cr>", desc = "Set conceal level 2" },
      { "<leader>w3", mode = { "n" }, "<cmd>set conceallevel=3<cr>", desc = "Set conceal level 3" },
    },
  },
}
