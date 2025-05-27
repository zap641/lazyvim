return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader><space>", false }, -- need to disable keymap to avoid conflict-loading with mini-files
    },
  },
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
    -- the following used to remap gc to avoid conflicting keymap
    config = function(_, opts)
      require("mini.files").setup(opts)

      local files_set_cwd = function()
        local cur_entry_path = MiniFiles.get_fs_entry().path
        local cur_directory = vim.fs.dirname(cur_entry_path)
        if cur_directory ~= nil then
          vim.fn.chdir(cur_directory)
        end
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          vim.keymap.set(
            "n",
            opts.mappings and opts.mappings.change_cwd or "g/",
            files_set_cwd,
            { buffer = args.data.buf_id, desc = "Set cwd" }
          )
        end,
      })
    end,
  },
  {
    "snacks.nvim",
    -- Add 'select session' to dashboard
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
    keys = {
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
