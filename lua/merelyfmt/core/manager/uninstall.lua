local M = {}

local cmd = vim.cmd
local fn = vim.fn
local o = vim.o

local utils_tbl = require("merelyfmt.utils.tbls")
local utils_paths = require("merelyfmt.utils.paths")
local formatters_list = require("merelyfmt.formatters.formatters")["formatters"]
local installation_path = require("merelyfmt.config").options["installation_path"]

function M.uninstall_formatter(formatter)
    if utils_tbl.tbl_has_element(formatters_list, formatter, "index") then
		local fmt = require("merelyfmt.formatters." .. formatter)
		local fmt_path = installation_path .. formatter .. "/"

        if (utils_paths.assert_dir(fmt_path) == 1) then
            if fn.confirm("Do you want to uninstall the formatter " .. formatter .. "?", "&Yes\n&Cancel") ~= 1 then
                return
            end

            local function onExit(_, code)
                if code ~= 0 then
                    error("Could not uninstall the formatter " .. formatter .. "!")
                end
                print("Successfully uninstalled the formatter " .. formatter .. "!")
            end

            if (fmt.installer["uninstall"] == "simple") then
                fn.delete("" .. fmt_path .. "", "rf")
                print("Successfully uninstalled the formatter " .. formatter .. "!")
            else
                cmd("new")
                local shell = o.shell
                o.shell = "/bin/bash"

                cmd(fmt.installer["before"])
                fn.termopen("set -e\n" .. fmt.installer["uninstall"], {["cwd"] = fmt_path, ["on_exit"] = onExit})
                o.shell = shell

                cmd("startinsert")
            end
        end
    else
		print("MerelyFmt: the formatter " .. formatter .. "does not exist/support for it is under development.")
    end
end

return M
