-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
-- Fullscreen (maximize mode)
hl.bind("SUPER + M", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Minimize: move active window to a special workspace
hl.bind("SUPER + N", function()
	local win = hl.get_active_window()
	if win.workspace.name:find("^special:minimized") then
		-- Window is in a special/minimized workspace — unminimize it
		local target_id = win.workspace.name:match("minimized_(%d+)")
		hl.dispatch(hl.dsp.window.move({ workspace = target_id }))
	else
		-- Minimize
		hl.dispatch(hl.dsp.window.move({ workspace = "special:minimized_" .. win.workspace.id, follow = false }))
	end
end)

-- Show all minimized windows for current workspace (toggle special workspace overlay)
hl.bind("SUPER + A", function()
	local ws = hl.get_active_workspace()
	hl.dispatch(hl.dsp.workspace.toggle_special("minimized_" .. ws.id))
end)

-- Unminimize: move window from special back to current workspace
hl.bind("SUPER + SHIFT + N", function()
	local ws = hl.get_active_workspace()
	hl.dispatch(hl.dsp.window.move({ workspace = tostring(ws.id) }))
end)

-- Misc bindings
hl.unbind("SUPER + SHIFT + SPACE")
o.bind("SUPER + ALT + CTRL + 4", "Screenshot with editing", { launch = "omarchy-capture-screenshot" })
-- o.bind("SUPER + CTRL + 4", "Screenshot to clipboard", { launch = "omarchy-cmd-screenshot smart clipboard" })

-- alt tab omarchy plugin
dofile(os.getenv("HOME") .. "/.config/omarchy/plugins/io.github.pablo-merino.altswitch/altswitch.lua")

hl.unbind("SUPER + D")
