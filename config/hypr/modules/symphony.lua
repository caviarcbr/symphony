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
   hl.exec_cmd(
          string.format(
              cmd
          )
      )
  end

  function M.tui()
    hl.exec_cmd("kitty --title symphony-tui -e ~/symphony/install/themes/symphony-tui")
  end

  function M.browse()
    hl.exec_cmd("kitty --title symphony-browse -e ~/symphony/install/themes/symphony browse")
  end



return M
