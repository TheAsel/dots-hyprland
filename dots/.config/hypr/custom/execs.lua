hl.on("hyprland.start", function()

	hl.exec_cmd("sleep 3 && keepassxc --minimized")
	hl.exec_cmd("sleep 3 && QT_QPA_PLATFORM=xcb synology-drive start")
	hl.exec_cmd("sleep 3 && trayscale --hide-window")

end)
