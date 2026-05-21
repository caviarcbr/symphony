local M = {}

function M.toggle()

    local handle = io.popen("pgrep -x hypridle")
    local result = handle:read("*a")
    local restart_bar = hl.exec_cmd("pkill -RTMIN+9 waybar")
    handle:close()

    -- Remove whitespace/newlines
    result = result:gsub("%s+", "")

    if result ~= "" then
        hl.exec_cmd("kill -9 " .. result)
        hl.exec_cmd([[notify-send "Screen Lock" "Off - Display will stay on"]])
        hl.exec_cmd("pkill -RTMIN+9 waybar")
    else
        hl.exec_cmd("uwsm-app -- hypridle")
        hl.exec_cmd([[notify-send "Screen Lock" "On - Display will sleep when inactive"]])
        hl.exec_cmd("pkill -RTMIN+9 waybar")
    end
end

  
return M
