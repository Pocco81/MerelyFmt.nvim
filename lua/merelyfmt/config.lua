local config = {}

config.options = {
    installation_path = vim.fn.stdpath("data") .. "/merelyfmt/",
}

function config.set_options(opts)
    opts = opts or {}
	config.options = vim.tbl_deep_extend("force", config.options, opts)
end

return config
