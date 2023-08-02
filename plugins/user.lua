return {
  {
    "smartpde/neoscopes",
    event = "VeryLazy",
    name = "neoscopes",
    config = function()
      -- require("neoscopes").add_start_up_scope()
      require("neoscopes").setup {
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
}
