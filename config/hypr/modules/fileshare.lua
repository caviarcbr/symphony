-- fileshare.lua
-- Hyprland 0.55+ Lua module: share files, folders, or clipboard via LocalSend.
-- Uses hl.exec_cmd() for all subprocess calls — fully async, never blocks the compositor.

local M = {}

-- ---------------------------------------------------------------------------
-- Helpers
-- ---------------------------------------------------------------------------

--- Spawn a shell command asynchronously via Hyprland's built-in async runner.
--- hl.exec_cmd() forks immediately; the compositor never waits on the child.
---@param cmd string  Shell command string (passed to sh -c)
local function spawn(cmd)
  hl.exec_cmd(cmd)
end

--- Build a localsend shell invocation for one or more file paths.
--- Uses systemd-run so LocalSend is detached from any session lifetime.
---@param files string[]
---@return string  Ready-to-exec shell command
local function localsend_cmd(files)
  local quoted = {}
  for _, f in ipairs(files) do
    quoted[#quoted + 1] = string.format("%q", f)
  end
  return "systemd-run --user --quiet --collect localsend --headless send "
    .. table.concat(quoted, " ")
end

--- Write a temp-file path into a well-known location so the picker result
--- can be read back after fzf exits. Returns the path of the result file.
---@return string
local function tmp_result_path()
  return os.tmpname()
end

-- ---------------------------------------------------------------------------
-- Picker helper
-- Opens foot (floating, tagged so window-rules can style it) running fzf,
-- writes the selection to a temp file, then calls `on_done(files)` when the
-- window closes via a hyprland window.close event.
--
-- NOTE: hl.on callbacks are global, so we disambiguate by app_id tag.
-- ---------------------------------------------------------------------------

local _pending_pickers = {}   -- keyed by unique app_id string

local function open_fzf_picker(find_cmd, fzf_flags, on_done)
  local tag     = "fzf_fileshare_" .. tostring(os.time()) .. "_" .. tostring(math.random(1e6))
  local outfile = os.tmpname()

  -- Launch foot with a unique app_id so we can identify the close event.
  -- fzf writes its result to outfile; `true` suppresses the exit code so
  -- foot doesn't show an error when the user cancels.
  local cmd = string.format(
    "kitty --title share --app-id=%s sh -c %q",
    tag,
    string.format("%s 2>/dev/null | fzf %s > %q; true", find_cmd, fzf_flags, outfile)
  )

  _pending_pickers[tag] = { outfile = outfile, on_done = on_done }
  spawn(cmd)   -- async — compositor moves on immediately
end

-- One global window.close handler; dispatches to the right picker by app_id.
hl.on("window.close", function(w)
  local entry = _pending_pickers[w.class]
  if not entry then return end
  _pending_pickers[w.class] = nil

  -- Read the result file (fzf may have written nothing if cancelled).
  local f = io.open(entry.outfile, "r")
  local lines = {}
  if f then
    for line in f:lines() do
      if line ~= "" then lines[#lines + 1] = line end
    end
    f:close()
  end
  os.remove(entry.outfile)

  entry.on_done(lines)
end)

-- ---------------------------------------------------------------------------
-- Public API
-- ---------------------------------------------------------------------------

--- Share the Wayland clipboard.
--- Saves clipboard text to a temp file then hands it to LocalSend.
function M.clipboard()
  -- mktemp + wl-paste are fast memory ops; run them in a tiny sh one-liner
  -- that is itself async so the compositor isn't touched.
  local cmd = [[
    TMP=$(mktemp --suffix=.txt) &&
    wl-paste > "$TMP" &&
    systemd-run --user --quiet --collect localsend --headless send "$TMP"
  ]]
  spawn(cmd)
end

--- Pick one or more files with fzf and share them.
---@param preselected string[]|nil  Optional list of paths; bypasses fzf when provided.
function M.file(preselected)
  if preselected and #preselected > 0 then
    spawn(localsend_cmd(preselected))
    return
  end

  open_fzf_picker(
    [[find "$HOME" -type f]],
    "--multi",
    function(files)
      if #files == 0 then return end
      spawn(localsend_cmd(files))
    end
  )
end

--- Pick a single folder with fzf and share it.
---@param preselected string|nil  Optional folder path; bypasses fzf when provided.
function M.folder(preselected)
  if preselected and preselected ~= "" then
    spawn(localsend_cmd({ preselected }))
    return
  end

  open_fzf_picker(
    [[find "$HOME" -type d]],
    "",   -- single-select (no --multi)
    function(lines)
      if #lines == 0 then return end
      spawn(localsend_cmd({ lines[1] }))
    end
  )
end

-- ---------------------------------------------------------------------------
-- Keybind registration
-- ---------------------------------------------------------------------------
-- Uncomment and adjust modifiers to taste, or call M.* from your own binds.

-- hl.bind("SUPER + SHIFT + C", function() M.clipboard() end)
-- hl.bind("SUPER + SHIFT + F", function() M.file() end)
-- hl.bind("SUPER + SHIFT + D", function() M.folder() end)

-- ---------------------------------------------------------------------------
-- Optional: make foot fzf windows float automatically.
-- Add this to your hyprland.lua (or uncomment here):
-- ---------------------------------------------------------------------------
-- hl.add_window_rule({
--   match = { app_id = "fzf_fileshare_.*" },
--   rule  = { float = true, size = { width = 800, height = 500 } },
-- })

return M
