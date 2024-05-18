require("jester").setup({
    -- cmd = "npm run test -t '$result' -- $file",
    cmd = "npm run test -- -t '$result' $file",
    dap = {
        type = "pwa-node",
        request = "launch",
        name = "Debug specific Jest Tests",
        -- trace = true, -- include debugger info
        runtimeExecutable = "node",
        runtimeArgs = {
            "./node_modules/jest/bin/jest.js",
            "--runInBand",
            "-t",
            "$result",
            "--",
            "$file",
        },
        rootPath = "${workspaceFolder}",
        -- cwd = "${workspaceFolder}",
        cwd = vim.fn.getcwd(),
        sourceMaps = false,
        skipFiles = {'<node_internals>/**/*.js'},
        console = "integratedTerminal",
        -- terminal_cmd = ":vsplit | terminal",
        -- internalConsoleOptions = "neverOpen",
    },
})

-- type = 'node2',
-- request = 'launch',
-- cwd = vim.fn.getcwd(),
-- runtimeArgs = {'--inspect-brk', '$path_to_jest', '--no-coverage', '-t', '$result', '--', '$file'},
-- args = { '--no-cache' },
-- sourceMaps = false,
-- protocol = 'inspector',
-- skipFiles = {'<node_internals>/**/*.js'},
-- console = 'integratedTerminal',
-- port = 9229,
-- disableOptimisticBPs = true
