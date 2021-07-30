local M = {}

local opts = require("merelyfmt.config").options
local formatters_list = require("merelyfmt.formatters.formatters")["formatters"]
local utils_paths = require("merelyfmt.utils.paths")

function M.available_commands()
    local arguments = {}

    for formatter, _ in pairs(formatters_list) do
        if (utils_paths.assert_dir(opts["installation_path"] .. formatter .. "/") == 1) then
            arguments[formatter] = formatter
        end
    end

    return vim.tbl_keys(arguments)
end

return M
