local M = {}


function M.save()
  hl.exec_cmd("~/.local/bin/screenshot")
end

function M.clip()
  hl.exec_cmd("~/.local/bin/screenshot smart clipboard")
end

return M

