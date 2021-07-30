local installation_path = require("merelyfmt.config").options.installation_path

local M = {}

M.config = {
    bin = installation_path .. "node_modules/.bin/luafmt"
}

M.commands = {
    ["lua"] = {
        exe = M.config.bin,
        args = "--stdin"
    }
}

M.installer = {
    install = [[
		npm install lua-fmt
	]],
    uninstall = "simple"
}

return M
