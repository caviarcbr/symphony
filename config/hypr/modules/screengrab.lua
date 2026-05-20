local M = {}


function M.save()
  os.execute("setsid ~/.local/bin/screenshot >/dev/null 2>&1 &")
end

function M.clip()
  os.execute("setsid ~/.local/bin/screenshot smart clipboard >/dev/null 2>&1 &")
end

return M

