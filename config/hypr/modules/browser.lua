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

local function detect_vaapi_env()
    local lspci = command_output("lspci")

    if lspci:match("VGA.*AMD") or lspci:match("Radeon") then
        return "LIBVA_DRIVER_NAME=radeonsi"
    end

    if lspci:match("VGA.*Intel") then
        return "LIBVA_DRIVER_NAME=iHD"
    end

    return ""
end

local function get_default_browser()
    local desktop = command_output(
        "xdg-settings get default-web-browser"
    )

    if desktop == "" then
        return "firefox"
    end

    local exec = command_output(string.format(
        "sed -n 's/^Exec=\\([^ ]*\\).*/\\1/p' /usr/share/applications/%s 2>/dev/null | head -1",
        desktop
    ))

    if exec == "" then
        return "firefox"
    end

    return exec
end

local function is_chromium(browser)
    browser = browser:lower()

    return browser:match("chrome")
        or browser:match("chromium")
        or browser:match("brave")
        or browser:match("vivaldi")
        or browser:match("edge")
        or browser:match("opera")
end

local function get_private_flag(browser)
    browser = browser:lower()

    if browser:match("firefox")
        or browser:match("zen")
        or browser:match("librewolf")
    then
        return "--private-window"
    end

    return "--incognito"
end

function M.launch(args)
    args = args or {}

    local env = detect_vaapi_env()
    local browser = get_default_browser()
    local private_flag = get_private_flag(browser)

    local processed = {}

    for _, arg in ipairs(args) do
        if arg == "--private" then
            table.insert(processed, private_flag)
        else
            table.insert(processed, arg)
        end
    end

    local cmd = ""

    if env ~= "" then
        cmd = string.format(
            "env %s setsid uwsm-app -- %s %s",
            env,
            browser,
            table.concat(processed, " ")
        )
    else
        cmd = string.format(
            "setsid uwsm-app -- %s %s",
            browser,
            table.concat(processed, " ")
        )
    end

    spawn(cmd)
end

function M.webapp(url, options)
    options = options or {}

    local env = detect_vaapi_env()
    local browser = get_default_browser()

    local args = {}

    -- chromium webapp mode
    if is_chromium(browser) then
        table.insert(args, '--app="' .. url .. '"')

        if options.class then
            table.insert(
                args,
                '--class="' .. options.class .. '"'
            )
        end

        if options.name then
            table.insert(
                args,
                '--name="' .. options.name .. '"'
            )
        end
    else
        -- fallback for firefox-like browsers
        table.insert(args, url)
    end

    -- append extra args
    if options.args then
        for _, arg in ipairs(options.args) do
            table.insert(args, arg)
        end
    end

    local cmd

    if env ~= "" then
        cmd = string.format(
            'env %s setsid uwsm-app -- %s %s',
            env,
            browser,
            table.concat(args, " ")
        )
    else
        cmd = string.format(
            'setsid uwsm-app -- %s %s',
            browser,
            table.concat(args, " ")
        )
    end

    spawn(cmd)
end

return M
