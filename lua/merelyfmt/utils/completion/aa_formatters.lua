local M = {}

local utils_paths = require("merelyfmt.utils.paths")
local utils_tbl = require("merelyfmt.utils.tbls")
local formatters_list = require("merelyfmt.formatters.formatters")["formatters"]
local opts = require("merelyfmt.config").options

function M.available_commands()

    local arguments = {}
	local available_formatters = {}


    for formatter, _ in pairs(formatters_list) do
        if (utils_paths.assert_dir(opts["installation_path"] .. formatter .. "/") == 1) then
            available_formatters[formatter] = formatter
        end
    end

    for formatter, _ in pairs(available_formatters) do
		if (utils_tbl.tbl_has_element(formatters_list[formatter], vim.o.filetype, "value")) then
            arguments[formatter] = formatter
		end
    end

    return vim.tbl_keys(arguments)
end

return M
