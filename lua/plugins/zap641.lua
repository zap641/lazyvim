return {
  -- Change explorer <leader>e keymap to minifiles
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader><space>",
        function()
          require("mini.files").open(LazyVim.root(), true)
        end,
        desc = "Open mini.files (root)",
      },
    },
  },
  {
    "snacks.nvim",
    opts = function(_, opts)
      table.insert(
        opts.dashboard.preset.keys,
        7,
        { icon = "", key = "S", desc = "Select Session", action = require("persistence").select }
      )
    end,
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>U", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undo Tree" },
    },
  },
}
