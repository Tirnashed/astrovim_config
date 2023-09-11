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
}
