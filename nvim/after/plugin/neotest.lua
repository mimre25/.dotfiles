
require("neotest").setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false }
        }),
        require("neotest-phpunit")({
            phpunit_cmd = function()
                return {"vendor/bin/sail", "test", "--parallel"}
             end,
            filter_dirs = { ".git", "node_modules", "vendor" },
        }),
    },
    running = {
      concurrent = false
    },
})

vim.keymap.set("n", "<leader>rt", function()
    local neotest = require("neotest")
    neotest.summary.open();
    neotest.run.run(vim.fn.getcwd());
    vim.cmd({cmd = "wincmd", args = {"l"}});
end)
