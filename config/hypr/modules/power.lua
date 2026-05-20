local M = {}


function M.menu()
  os.execute("setsid ~/.local/bin/powermenu >/dev/null 2>&1 &")
end

function M.lock()
  os.execute("setsid ~/.local/bin/lock-screen >/dev/null 2>&1 &")
end

function M.shutdown()
  os.execute("setsid ~/.local/bin/graceful-shutdown >/dev/null 2>&1 &")
end

function M.shutdown()
  os.execute("setsid ~/.local/bin/graceful-reboot >/dev/null 2>&1 &")
end

return M

