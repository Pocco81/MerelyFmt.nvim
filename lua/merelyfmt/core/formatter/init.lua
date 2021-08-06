local M = {}

local api = require("merelyfmt.api.formatters")
local opts = require("merelyfmt.config").options
local tbl_utils = require("merelyfmt.utils.tbls")
local opt_local = vim.opt_local


local function assert_conditions()

	local msg
	local err = false

    if not opt_local.modifiable:get() then
        msg = "MerelyFmt: Failed to format current buffer becuase it is not modifiable"
		err = true
    end

    if opt_local.readonly:get() then
        msg = "MerelyFmt: Failed to format current buffer becuase it is read-only"
		err = true
    end

	return err, msg
end

function M.format(formatter)

	local err, msg = assert_conditions()
	if err then error(msg) end

	-- procedure:
	-- 1. try passed formatter
	-- 2. try default formatter if any (passed by user)
	-- 3. try every formatter

    local file, filetype = vim.fn.expand("%"), vim.bo.filetype
    -- TODO: apply a filter to installed formatters
    local formatters = {}
    for fmt in pairs(api.get_formatters_by_lang()[filetype]) do
        if tbl_utils.tbl_has_element(api.get_installed_formatters(), fmt, "value") then
            table.insert(formatters, fmt)
        end
    end
    print(vim.inspect(formatters))

    -- If no specific formatter was passed
    if not formatter then
        if tbl_utils.tbl_has_element(opts.default_formatters, filetype, "value") then
            -- Use the default formatter for the current filetype
            formatter = opts.default_formatters[filetype]
            print("MerelyFmt: Using " .. formatter .. " formatter for " .. filetype)
        else
            local failed_formatting, successful_formatting
            for _, fmt in ipairs(formatters) do
                -- Restore the 'failed_formatting' variable in the next iteration
                -- if the actual formatter failed to format the current file
                if failed_formatting then
                    failed_formatting = false
                end
            end
        end
    else
        print("MerelyFmt: Using passed formatter")
    end
end

return M
