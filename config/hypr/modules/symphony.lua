local M = {}

function M.switch(args)
    local cmd


    if args == "random" then
      cmd = "~/symphony/install/themes/symphony switch --random"

    elseif args == nil then
      cmd = "~/symphony/install/themes/symphony switch"

    elseif args == "browse" then
      cmd = "kitty --title symphony-browse -e ~/symphony/install/themes/symphony browse"

      return
      
    end
   os.execute(
          string.format(
              "setsid %s >/dev/null 2>&1 &",
              cmd
          )
      )
  end

  function M.tui()
    os.execute("setsid kitty --title symphony-tui -e ~/symphony/install/themes/symphony-tui >/dev/null 2>&1 &")
  end

  function M.browse()
    os.execute("setsid kitty --title symphony-browse -e ~/symphony/install/themes/symphony browse >/dev/null 2>&1 &")
  end



return M
