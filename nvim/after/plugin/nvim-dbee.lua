local dbee = require("dbee")

vim.keymap.set("n", "<leader>db", dbee.toggle, { unique = true })
