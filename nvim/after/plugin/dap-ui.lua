local dapui = require("dapui")


dapui.setup()

vim.keymap.set({"n","v"}, "<leader>du", dapui.toggle)
