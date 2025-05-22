return {
  -- Change explorer <leader>e keymap to minifiles
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader>fm",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
      {
        "<leader>fM",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
      {
        "<leader><space>",
        function()
          require("mini.files").open(LazyVim.root(), true)
        end,
        desc = "Open mini.files (root)",
      },
      { "<leader>e", "<leader>fm", desc = "Open mini.files (Directory of Current File)", remap = true },
      { "<leader>E", "<leader>fM", desc = "Open mini.files (cwd)", remap = true },
    },
    opts = {
      options = {
        use_as_default_explorer = true,
      },
    },
  },
  {
    "snacks.nvim",
    opts = function(_, opts)
      table.insert(
        opts.dashboard.preset.keys,
        7,
        { icon = "S", key = "S", desc = "Select Session", action = require("persistence").select }
      )
    end,
  },
}
