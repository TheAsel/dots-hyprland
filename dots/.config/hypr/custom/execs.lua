hl.on("hyprland.start", function()

	hl.exec_cmd("keepassxc --minimized")
	hl.exec_cmd("QT_QPA_PLATFORM=xcb synology-drive start")
	hl.exec_cmd("trayscale --hide-window")

end)
