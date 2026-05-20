local notify = require("modules.notify")

local M = {}


local function spawn(cmd)
    os.execute(cmd .. " >/dev/null 2>&1 &")
end

local function command_output(cmd)
    local handle = io.popen(cmd)

    if not handle then
        return ""
    end

    local result = handle:read("*a")
    handle:close()

    return result:gsub("%s+$", "")
end

function M.pid()
    local pid = command_output(
        "pgrep -x hypridle | head -1"
    )

    if pid == "" then
        return nil
    end

    return tonumber(pid)
end

function M.running()
    return M.pid() ~= nil
end
local function run(cmd)
  os.execute(cmd .. " >/dev/null 2&>1 &")
end

function M.start()
    spawn("uwsm-app -- hypridle")
    run(string.format([[
    bash -c '
    pkill -RTMIN+9 waybar
    '
    ]]))
    notify.send("Screen Lock", "On - Display will sleep when inactive")
end

function M.stop()
    local pid = M.pid()

    if pid then
        spawn("kill -9 " .. pid)
    end
    run(string.format([[
    bash -c '
    pkill -RTMIN+9 waybar
    '
    ]]))
    notify.send("Screen Lock", "Off - Display will stay on")
end

function M.toggle()
    if M.running() then
        M.stop()
    else
        M.start()
    end
end

return M
