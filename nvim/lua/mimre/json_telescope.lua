local lsp = require('lsp-zero')
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")
local utils = require("telescope.previewers.utils")
local config = require("telescope.config").values

local log = require("plenary.log"):new()
log.level = "debug"

local M = {}

function map(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do
        log.debug("map", k, "value:", v)
        table.insert(t, f(k, v))
    end
    return t
end

M.get_entries = function(parsed)
    local keys = {}
    for key, value in pairs(parsed) do
        keys[key] = value
        if type(value) == 'table' then
            local res = M.get_entries(value)
            for inner_key, inner_value in pairs(res) do
                log.debug("inner", inner_key, inner_value)
                keys[key .. "." .. inner_key] = inner_value
            end
        end
    end
    return keys
end

M.transform_entries = function(entries)
    log.debug("entries:", vim.inspect(entries))
    return map(entries, function(key, entry)
        return {
            name = key,
            value = entry,
            key = entry
        }
    end)
end

M.json_explore = function(opts)
    local buffer = vim.api.nvim_get_current_buf()
    local content = vim.api.nvim_buf_get_lines(buffer, 0, -1, true)
    log.debug("content", content)
    local parsed = vim.json.decode(vim.fn.join(content, "\n"))
    -- local parsed = vim.json.decode('{"foo": "bar", "baz": { "foo": "bar", "baz": {"xxx": 1 }}, "alpha": 13}')
    pickers.new(opts, {
        finder = finders.new_table {
            results = M.transform_entries(M.get_entries(parsed)),
            entry_maker = function(entry)
                log.debug("Entry:", entry)
                if parsed then
                    return {
                        value = entry,
                        display = entry["name"],
                        ordinal = entry["name"]
                    }
                end
            end
        },

        sorter = config.generic_sorter(opts),
        previewer = previewers.new_buffer_previewer({
            title = "Json Values",
            define_preview = function(self, entry)
                log.debug("entry:", entry, vim.json.encode(entry.value.value))
                local raw_json_string = vim.json.encode(entry.value.value)
                local res = vim.api.nvim_exec2("!echo '"..raw_json_string.."' | jq", {output = true})
                local formatted_json_string = res["output"]
                local lines = vim.fn.flatten(vim.fn.split(formatted_json_string, "\n"))
                table.remove(lines, 1)
                table.remove(lines, 1)

                vim.api.nvim_buf_set_lines(self.state.bufnr, 0, 0, true, lines)
                utils.highlighter(self.state.bufnr, "json")
            end
        }),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                -- TODO jump to line of elem
                if selection then
                    -- local command = {
                    --     "silent",
                    --     "!tmux",
                    --     "switch-client",
                    --     "-t",
                    --     selection.value.session_name,
                    -- }
                    -- vim.cmd(vim.fn.join(command, " "))
                end
            end)
            return true
        end

    }):find()
end

-- M.json_explore()
-- vim.keymap.set("n", "<leader>j", function()
--     if vim.bo.filetype == '' then
--         vim.bo.filetype = 'json'
--         lsp.new_client({
--             filetypes = 'json',
--             on_attach = vim.cmd('Telescope jsonfly')
--         })
--     else
--         vim.cmd('Telescope jsonfly')
--     end
-- end)

--vim.cmd('Telescope jsonfly')
return M
