local M = {}

local fn = vim.fn
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

local function get_available_formatters(filetype, formatters_by_lang, installed_formatters)
    local formatters = {}

    -- TODO: apply a filter to installed formatters
    for _, fmt in pairs(formatters_by_lang[filetype]) do
        if tbl_utils.tbl_has_element(installed_formatters, fmt, "value") then
            table.insert(formatters, fmt)
        end
    end

    return formatters
end

local function do_formatting(file, command)
end

function M.format(formatter)
    local err, msg = assert_conditions()
    if err then
        error(msg)
    end

    local view = fn.winsaveview()

    local file, filetype = vim.fn.expand("%"), vim.bo.filetype
    local formatters_by_lang = api.get_formatters_by_lang()
    local installed_formatters = api.get_installed_formatters()
    local available_formatters = get_available_formatters(filetype, formatters_by_lang, installed_formatters)

    -- procedure:
    -- 1. try passed formatter
    -- 2. try default formatter if any (passed by user)
    -- 3. try every formatter

    print(vim.inspect(available_formatters))

    -- If no specific formatter was passed
    if not formatter then
        if tbl_utils.tbl_has_element(opts.default_formatters, filetype, "value") then
            -- Use the default formatter for the current filetype
            formatter = opts.default_formatters[filetype]
            print("MerelyFmt: Using " .. formatter .. " formatter for " .. filetype)
        else
            local failed_formatting, successful_formatting
            for _, fmt in ipairs(available_formatters) do
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

    fn.winrestview(view)
end

return M
