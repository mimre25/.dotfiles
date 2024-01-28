
require("neotest").setup({
    adapters = {
        require("neotest-python")({}),
    }
})

vim.keymap.set("n", "<leader>rt", function()
    local neotest = require("neotest")
    neotest.summary.open();
    neotest.run.run();
    vim.cmd({cmd = "wincmd", args = {"l"}});
end)
