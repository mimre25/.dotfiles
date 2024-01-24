local dap_python = require('dap-python')
dap_python.setup('/home/martin/micromamba/bin/python')

dap_python.test_runner = "pytest"
local default_test_opts = {
    console = 'integratedTerminal',
    cwd = vim.fn.getcwd()
}

local function load_dap()
    local ok, dap = pcall(require, 'dap')
    assert(ok, 'nvim-dap is required to use dap-python')
    return dap
end

function mysplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

function table.slice(tbl, first, last, step)
    local sliced = {}

    for i = first or 1, last or #tbl, step or 1 do
        sliced[#sliced + 1] = tbl[i]
    end

    return sliced
end

function debug_arbitrary(opts)
    opts = vim.tbl_extend('keep', opts or {}, default_test_opts)
    code = vim.fn.input("Python > ")
    _input = mysplit(code)
    module = _input[1]
    args = table.slice(_input, 2, #_input)

    local config = {
        type = 'python',
        request = 'launch',
        module = module,
        args = args,
        console = opts.console
    }
    load_dap().run(vim.tbl_extend('force', config, opts.config or {}))
end

vim.keymap.set("n", "<leader>da", debug_arbitrary)
