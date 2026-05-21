local M = {}


function M.desk()
  hl.exec_cmd("~/.local/bin/screenrecord --with-desktop-audio")
end

function M.deskmic()
  hl.exec_cmd("~/.local/bin/screenrecord --with-desktop-audio --with-microphone-audio")
end

function M.cam()
  hl.exec_cmd("~/.local/bin/screenrecord --with-desktop-audio --with-microphone-audio --with-webcam")
end

return M

