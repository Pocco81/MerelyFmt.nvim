local M = {}

function M.available_commands()
    return vim.tbl_keys(require("merelyfmt.formatters.formatters")["formatters"])
end

return M
