local M = {}

function M.emoji()
    os.execute(
        "setsid ~/.local/bin/emoji >/dev/null 2>&1 &"
    )
end

function M.keyhints()
    os.execute(
        "setsid ~/.local/bin/keyhints >/dev/null 2>&1 &"
    )
end

function M.clipboard()
    os.execute(
        "setsid ~/.local/bin/clipboard >/dev/null 2>&1 &"
    )
end

function M.search()
    os.execute(
        "setsid ~/.local/bin/rofisearch >/dev/null 2>&1 &"
    )
end

function M.app()
    os.execute(
        "setsid pkill rofi || rofi -show drun >/dev/null 2>&1 &"
    )
end

function M.theme(args)
    local cmd

    if args == "matugen" then
      cmd = "setsid ~/.local/bin/selectWall >/dev/null 2>&1 &"
    elseif args == "wall" then
      cmd = "setsid ~/.local/bin/wallPicker >/dev/null 2>&1 &"
    elseif args == "random" then
      cmd = "setsid ~/.local/bin/change-theme >/dev/null 2>&1 &"
    elseif args == "theme" then
      cmd = "setsid ~/symphony/install/themes/symphony switch >/dev/null 2>&1 &"
    else
      return
    end
   os.execute(
          string.format(
              "setsid %s >/dev/null 2>&1 &",
              cmd
          )
      )
  end



return M
