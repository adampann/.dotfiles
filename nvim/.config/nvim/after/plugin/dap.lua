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
