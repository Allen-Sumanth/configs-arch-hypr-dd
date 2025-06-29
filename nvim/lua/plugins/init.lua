return {
  { "nvim-neotest/nvim-nio" },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },

  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      --require("core.utils").load_mappings("dap")
    end
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_lua").lazy_load({
        paths = "~/.config/nvim/snippets/"
        -- paths = { vim.fn.stdpath("config") .. "/snippets/" }
      })
    end,
    event = "InsertEnter",
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-cmp", -- Ensure nvim-cmp is loaded
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "cpp", "c", "hpp", "h" },
        callback = function()
          require("cmp").setup.buffer { enabled = false }
        end,
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          -- For external built-ins from none-ls-extras:
          require("none-ls.diagnostics.eslint_d"),
          -- require("none-ls.diagnostics.flake8"), -- example for flake8
        }
      }
    end,
  },

  -- {
  --   "nvimtools/none-ls.nvim",
  --   event="VeryLazy",
  --   opts = function ()
  --     return require "configs.null-ls"
  --   end,
  -- },
  --

  {
    "kawre/leetcode.nvim",
    lazy = false,
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
        "nvim-telescope/telescope.nvim",
        -- "ibhagwan/fzf-lua",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = function ()
      return require "configs.leetcode"
    end,
  }
}
