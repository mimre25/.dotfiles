local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")
local utils = require("telescope.previewers.utils")
local config = require("telescope.config").values

local log = require("plenary.log"):new()
-- log.level = 'debug'

local M = {}


M.show_tmux_sessions = function(opts)
    pickers.new(opts, {
        finder = finders.new_async_job({
            command_generator = function()
                return { "tmux", "list-sessions", "-F", '{ "session_name": "#{session_name}"}' }
            end,
            entry_maker = function(entry)
                log.debug(entry)
                local parsed = vim.json.decode(entry)
                if parsed then
                    log.debug(parsed)
                    return {
                        value = parsed,
                        display = parsed.session_name,
                        ordinal = parsed.session_name
                    }
                end
            end

        }),
        sorter = config.generic_sorter(opts),
        previewer = previewers.new_buffer_previewer({
            title = "Tmux session",
            define_preview = function(self, entry)
                local command = {
                    "silent",
                    "!tmux",
                    "list-windows",
                    "-t",
                    entry.value.session_name,
                }
                local res = vim.api.nvim_exec2(vim.fn.join(command, " "), {output = true})
                local windows = vim.fn.split(res.output, "\n")
                log.debug('windows before', windows)
                table.remove(windows, 1)
                table.remove(windows, 1)
                log.debug('windows', windows)

                vim.api.nvim_buf_set_lines(self.state.bufnr, 0, 0, true,
                    vim.tbl_flatten({ "#" .. entry.value.session_name, "", windows }))
                utils.highlighter(self.state.bufnr, "sh")
            end
        }),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                if selection then
                    local command = {
                        "silent",
                        "!tmux",
                        "switch-client",
                        "-t",
                        selection.value.session_name,
                    }
                    log.debug("Selected", command)
                    vim.cmd(vim.fn.join(command, " "))
                end
            end)
            return true
        end

    }):find()
end

vim.keymap.set("n", "<leader>t", function() M.show_tmux_sessions() end)

return M
