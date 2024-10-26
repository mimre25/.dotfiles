local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { unique = true })
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { unique = true })

-- not sure if I need those
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, {unique=true})
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end, {unique=true})
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end, {unique=true})
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end, {unique=true})

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-g>", function()
	harpoon:list():prev()
end, { unique = true })
vim.keymap.set("n", "<C-h>", function()
	harpoon:list():next()
end, { unique = true })

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<Leader>pt", function()
	toggle_telescope(harpoon:list())
end, { desc = "Telescope Harpoon List", unique = True })
