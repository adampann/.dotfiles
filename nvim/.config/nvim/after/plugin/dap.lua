require("dapui").setup()
require("nvim-dap-virtual-text").setup({})

-- Python dap 
require('dap-python').setup('~/.env/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'

-- dapui listeners
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
end

-- change dap's json decoder. Goes from nvim's default to a json5 decoder.
-- This allows for dap config files to have trailing commas & comments.
-- require('dap.ext.vscode').json_decode = require('json5').parse


-- Add telescope support for dap
require('telescope').load_extension('dap')
