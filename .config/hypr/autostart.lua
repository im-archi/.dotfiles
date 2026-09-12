-- Extra autostart processes.
-- o.launch_on_start("my-service")
-- Wallpapers
-- o.launch_on_start("hyprpm reload -n")
-- o.launch_on_start(' sh -c "sleep 3 && killall waybar"')
o.launch_on_start(' sh -c "sleep 3 && killall waybar"')
o.launch_on_start("ironbar")

-- Check if this need to be added:

-- # NVIDIA environment variables
-- env = NVD_BACKEND,direct
-- env = LIBVA_DRIVER_NAME,nvidia
-- env = __GLX_VENDOR_LIBRARY_NAME,nvidia
