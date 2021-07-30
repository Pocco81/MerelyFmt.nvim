local M = {}

local manager_prefix = "merelyfmt.core.manager."

function M.main(option, command_option)
    option = option or 0
    command_option = command_option or "NONE"

    if (option == "install") then
        require(manager_prefix .. "install").install_formatter(command_option)
    elseif (option == "uninstall") then
        require(manager_prefix .. "uninstall").uninstall_formatter(command_option)
    elseif (option == "list") then
        require(manager_prefix .. "list").list_formatters(command_option)
    else
        print("DAPInstall: Command was not recognized")
    end
end

return M
