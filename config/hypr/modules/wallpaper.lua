local M = {}


function M.change()
  hl.exec_cmd("~/.local/bin/cycle-wallpaper")
end

function M.next()
  hl.exec_cmd("~/.local/bin/cycle-wallpaper next")
end

function M.prev()
  hl.exec_cmd("~/.local/bin/cycle-wallpaper prev")
end

return M

