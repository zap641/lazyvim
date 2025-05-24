return {
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader><space>", -- Quick mini-files keymap
        function()
          require("mini.files").open(LazyVim.root(), true)
        end,
        desc = "Open mini.files (root)",
        remap = true, -- Requires this line for it not to get overwritten
        -- this keymap doesnt always remap the existing keymap -- need to fix.
        -- also need to configure the change directory in mini.files from gc to something else as it conflicts with gc commenting
      },
    },
  },
  {
    "snacks.nvim",
    opts = function(_, opts)
      table.insert( -- Add select session to dashboard
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
    keys = { -- Load the plugin only when using it's keybinding:
      { "<leader>U", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undo Tree" },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      scroll = {
        enabled = false, -- Disable scrolling animations
      },
    },
  },
}
