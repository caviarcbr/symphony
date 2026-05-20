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
        "pgrep -x waybar | head -1"
    )

    if pid == "" then
        return nil
    end

    return tonumber(pid)
end

function M.running()
    return M.pid() ~= nil
end

function M.start()
    spawn("uwsm-app -- waybar")
end

function M.stop()
    local pid = M.pid()

    if pid then
        spawn("kill -9 " .. pid)
    end
end

function M.toggle()
    if M.running() then
        M.stop()
    else
        M.start()
    end
end

return M
