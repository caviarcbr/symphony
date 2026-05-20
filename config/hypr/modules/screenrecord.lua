local M = {}


function M.desk()
  os.execute("setsid ~/.local/bin/screenrecord --with-desktop-audio >/dev/null 2>&1 &")
end

function M.deskmic()
  os.execute("setsid ~/.local/bin/screenrecord --with-desktop-audio --with-microphone-audio >/dev/null 2>&1 &")
end

function M.cam()
  os.execute("setsid ~/.local/bin/screenrecord --with-desktop-audio --with-microphone-audio --with-webcam >/dev/null 2>&1 &")
end

return M

