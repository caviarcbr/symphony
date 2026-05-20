local M = {}


function M.change()
  os.execute("setsid ~/.local/bin/cycle-wallpaper >/dev/null 2>&1 &")
end

function M.next()
  os.execute("setsid ~/.local/bin/cycle-wallpaper next >/dev/null 2>&1 &")
end

function M.prev()
  os.execute("setsid ~/.local/bin/cycle-wallpaper prev >/dev/null 2>&1 &")
end

return M

