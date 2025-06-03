return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    opts = {},
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = { "mfussenegger/nvim-dap", 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
       -- Adapter management using mason.nvim
      {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = { 'williamboman/mason.nvim', 'mfussenegger/nvim-dap' },
        cmd = { 'DapInstall', 'DapUninstall' }, -- Lazy-load on these commands
        opts = {
          -- ensure_installed is a user preference, default is {}
          ensure_installed = {
            "python",
            "chrome",
          },
          automatic_installation = false, -- Default is false
          handlers = {}, -- Default is nil; {} uses default handlers for installed DAPs
        },
        -- The setup for mason-nvim-dap is called in nvim-dap's config function below
      },
    },
    config = function(_, opts)
      local dap = require('dap')
      local fn = vim.fn
      local api = vim.api

      -- Define DAP signs for breakpoints and current instruction pointer (user preference)
      fn.sign_define('DapBreakpoint', { text = '🛑', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
      fn.sign_define('DapBreakpointCondition', { text = '❓', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
      fn.sign_define('DapLogPoint', { text = '🪵', texthl = 'DapLogPoint', linehl = '', numhl = '' })
      fn.sign_define('DapStopped', { text = '▶️', texthl = 'DapStopped', linehl = 'CursorLine', numhl = '' })
      fn.sign_define('DapRejected', { text = '❌', texthl = 'DapRejected', linehl = '', numhl = '' })

      -- Highlight for the line where the debugger is currently stopped (user preference)
      api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      -- Load mason-nvim-dap here, after nvim-dap and other adapters might be set up
      local mason_dap_ok, mason_dap = pcall(require, "mason-nvim-dap")
      if mason_dap_ok then
        local mason_dap_plugin_opts = {}
        -- Retrieve opts defined in the mason-nvim-dap.nvim plugin spec
        for _, plugin_spec in ipairs(require('lazy.core.config').plugins) do
          if plugin_spec.name == 'mason-nvim-dap.nvim' then
            mason_dap_plugin_opts = plugin_spec.opts or {}
            break
          end
        end
        mason_dap.setup(mason_dap_plugin_opts)
      end

    end,
    keys = { -- Define keymaps for nvim-dap and nvim-dap-ui (user preference)
      -- Core DAP controls
      { "<leader>db", function() require('dap').toggle_breakpoint() end, desc = "DAP: Toggle Breakpoint" },
      { "<leader>dB", function() require('dap').set_breakpoint(vim.fn.input('Breakpoint Condition: ')) end, desc = "DAP: Set Conditional Breakpoint" },
      { "<leader>dl", function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log Message: ')) end, desc = "DAP: Set Log Point" },
      { "<leader>dc", function() require('dap').continue() end, desc = "DAP: Continue" },
      { "<leader>dC", function() require('dap').run_to_cursor() end, desc = "DAP: Run to Cursor" },
      { "<leader>do", function() require('dap').step_out() end, desc = "DAP: Step Out" },
      { "<leader>di", function() require('dap').step_into() end, desc = "DAP: Step Into" },
      { "<leader>dO", function() require('dap').step_over() end, desc = "DAP: Step Over" },
      { "<leader>dr", function() require('dap').repl.toggle() end, desc = "DAP: Toggle REPL" },
      { "<leader>dR", function() require('dap').run_last() end, desc = "DAP: Run Last" },
      { "<leader>dt", function() require('dap').terminate() end, desc = "DAP: Terminate" },
      { "<leader>dk", function() require('dap').up() end, desc = "DAP: Up Stack Frame" },
      { "<leader>dj", function() require('dap').down() end, desc = "DAP: Down Stack Frame" },
      { "<leader>ds", function() require('dap').session() end, desc = "DAP: Session Details" },
      { "<leader>dg", function() require('dap').goto_() end, desc = "DAP: Go to (No Execute)" },
      { "<leader>dp", function() require('dap').pause() end, desc = "DAP: Pause" },
      { "<leader>dw", function() require('dap.ui.widgets').hover() end, desc = "DAP: Widgets Hover" },

      -- DAP UI controls
      { "<leader>du", function() require("dapui").toggle({}) end, desc = "DAP UI: Toggle" },
      { "<leader>de", function() require("dapui").eval(nil, { enter = true }) end, mode = { "n", "v" }, desc = "DAP UI: Evaluate Expression" },
    },
  },
}
