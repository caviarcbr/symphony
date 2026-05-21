local M = {}
function M.toggle()

    local handle = io.popen("pgrep -x waybar")
    local result = handle:read("*a")
    handle:close()

    -- Remove whitespace/newlines
    result = result:gsub("%s+", "")

    if result ~= "" then
        hl.exec_cmd("kill -9 " .. result)
    else
        hl.exec_cmd("uwsm-app -- waybar")
    end
end
  
return M
