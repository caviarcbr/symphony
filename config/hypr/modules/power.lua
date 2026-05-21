local M = {}

  local function close_all_windows()
      local clients = hl.get_clients()

      for _, client in ipairs(clients) do
          hl.dispatch(
              string.format("closewindow address:%s", client.address)
          )
      end
  end




-- powermenu.lua

function M.powermenu()
  hl.exec_cmd([=[
    scrDir="$HOME/.local/bin"
    options="Shutdown\nReboot\nSuspend\nLogout\nLock\nLaunch Screensaver"

    choice=$(echo -e "$options" | rofi -dmenu -p "" -config "$HOME/.config/rofi/custom-rofi/config-powermenu.rasi")

    case "$choice" in
    "Shutdown")
      "$scrDir/graceful-shutdown"
      ;;
    "Reboot")
      "$scrDir/graceful-reboot"
      ;;
    "Suspend")
      systemctl suspend
      ;;
    "Logout")
      if pgrep -x uwsm >/dev/null; then
        uwsm stop
      else
        hyprctl dispatch "hl.dsp.exit()"
      fi
      ;;
    "Lock")
      loginctl lock-session
      ;;
    "Launch Screensaver")
      screensaver-launch
      ;;
    esac
  ]=])
end

  

function M.lock()
  hl.exec_cmd("loginctl lock-session")
end


function M.shutdown()
    close_all_windows()

    hl.exec_cmd("sleep 1")
    hl.exec_cmd("systemctl poweroff --no-wall")
end

function M.reboot()
    close_all_windows()

    hl.exec_cmd("sleep 1")
    hl.exec_cmd("systemctl reboot --no-wall")
end

return M

