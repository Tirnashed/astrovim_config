-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local utils = require "astronvim.utils"
local get_icon = utils.get_icon

local sections = {
  s = { desc = get_icon("Session", 1, true) .. "Scope" },
}

local scopes = require "neoscopes"
scopes.add_startup_scope()

local search_dirs = scopes.get_current_dirs()
local glob_pattern = {}

-- Helper functions to fetch the current scope and set `search_dirs`
_G.find_files_s = function()
  require("telescope.builtin").find_files {
    search_dirs = search_dirs,
  }
end
_G.live_grep_s = function()
  require("telescope.builtin").live_grep {
    search_dirs = search_dirs,
    glob_pattern = glob_pattern,
  }
end
_G.grep_string_s = function()
  require("telescope.builtin").grep_string {
    search_dirs = search_dirs,
    glob_pattern = glob_pattern,
  }
end

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>s"] = sections.s,
    ["<leader>ss"] = { function() require("neoscopes").select() end, desc = "Select Scope" },
    ["<leader>sg"] = { "<cmd>lua live_grep_s()<cr>", desc = "Live Grep in Scope" },
    ["<leader>sf"] = { "<cmd>lua find_files_s()<cr>", desc = "Find File in Scope" },
    ["<leader>sc"] = { "<cmd>lua grep_string_s()<cr>", desc = "Search Word under Cursor in Scope" },

    ["<leader>f<CR>"] = { false },
    ["<leader><space>"] = { function() require("telescope.builtin").resume() end, desc = "Resume previous search" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
