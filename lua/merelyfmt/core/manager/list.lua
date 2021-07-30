local M = {}

local cmd = vim.cmd
local fn = vim.fn
local o = vim.o

local opts = require("merelyfmt.config").options

function M.list_formatters()
    local function onExit(_, code)
        if code ~= 0 then
            error("Could not list the formatters!")
        end
        print("Successfully listed formatters!")
    end

    cmd("new")
    local shell = o.shell
    o.shell = "/bin/bash"

    fn.termopen("set -e\n ls -Gg " .. opts["installation_path"] .. "", {["on_exit"] = onExit})
    o.shell = shell

    cmd("startinsert")
end

return M
