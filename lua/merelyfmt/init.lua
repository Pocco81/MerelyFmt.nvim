local M = {}

function M.setup(custom_opts)
	require("merelyfmt.config").set_options(custom_opts)
end

return M
