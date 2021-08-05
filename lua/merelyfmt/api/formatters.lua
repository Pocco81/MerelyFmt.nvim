local M = {}

function M.get_formatters()
	return require("merelyfmt.formatters.formatters")["formatters"]
end

function M.get_formatters_by_lang()
	local utils_tbl = require("merelyfmt.utils.tbls")
	local formatters_list = M.get_formatters()
	local formatters_by_lang = {}

    for formatter, _ in pairs(formatters_list) do
		for _, lang in pairs(formatters_list[formatter]) do
			if not (utils_tbl.tbl_has_element(formatters_by_lang, lang, "index")) then
				formatters_by_lang[lang] = {}
			end

			if not (utils_tbl.tbl_has_element(formatters_by_lang[lang], formatter, "value")) then
				table.insert(formatters_by_lang[lang], formatter)
			end
		end
    end

	return formatters_by_lang
end


function M.get_installed_formatters()

	local opts = require("merelyfmt.config").options
	local formatters_list = M.get_formatters()
	local utils_paths = require("merelyfmt.utils.paths")
    local installed_formatters = {}

    for formatter, _ in pairs(formatters_list) do
        if (utils_paths.assert_dir(opts["installation_path"] .. formatter .. "/") == 1) then
			table.insert(installed_formatters, formatter)
        end
    end

	return installed_formatters
end

return M
