local M = {}

function M.spawn(cmd)
    os.execute(cmd .. " >/dev/null 2>&1 &")
end

function M.send(title, body, urgency, timeout)
    urgency = urgency or "normal"
    timeout = timeout or 2000

    M.spawn(string.format(
        'notify-send -u %s -t %d "%s" "%s"',
        urgency,
        timeout,
        title,
        body
    ))
end

return M
