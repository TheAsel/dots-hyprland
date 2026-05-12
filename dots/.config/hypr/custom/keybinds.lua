hl.bind("CTRL + SUPER + Slash", hl.dsp.exec_cmd("xdg-open ~/.config/illogical-impulse/config.json"))   --# Edit shell config
hl.bind("CTRL + SUPER + ALT + Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.conf")) --# Edit extra keybinds

hl.unbind("SUPER + A")
hl.unbind("SUPER + Slash")
hl.unbind("CTRL + ALT + Delete")
hl.unbind("SUPER + ALT + Space")
hl.unbind("SUPER + F")
hl.unbind("SUPER + ALT + 1")
hl.unbind("SUPER + ALT + 2")
hl.unbind("SUPER + ALT + 3")
hl.unbind("SUPER + ALT + 4")
hl.unbind("SUPER + ALT + 5")
hl.unbind("SUPER + ALT + 6")
hl.unbind("SUPER + ALT + 7")
hl.unbind("SUPER + ALT + 8")
hl.unbind("SUPER + ALT + 9")
hl.unbind("SUPER + ALT + 0")
hl.unbind("SUPER + W")

hl.bind("SHIFT + SUPER + A", hl.dsp.global("quickshell:sidebarLeftToggle"), {description = "Toggle left sidebar"} )
hl.bind("SHIFT + SUPER + K", hl.dsp.global("quickshell:cheatsheetToggle"), {description = "Toggle cheatsheet"} )
hl.bind("SUPER + Backspace", hl.dsp.global("quickshell:sessionToggle"), {description = "Toggle session menu"} )
hl.bind("SUPER + W", hl.dsp.window.float({action = "toggle"}), {description = "Float/Tile"}) --# Float/Tile
hl.bind("ALT + Return", hl.dsp.window.fullscreen({"fullscreen"}, {description = "Fullscreen"}) ) --# Fullscreen
--# Send to workspace
for i = 1, 10 do
 local numberkey = {10,11,12,13,14,15,16,17,18,19}
 hl.bind("SUPER + SHIFT + code:"..numberkey[i], hl.dsp.window.move({ workspace = i, follow = false}) )
end
hl.bind("SUPER + F", hl.dsp.exec_cmd(browser), {description = "Browser"} )
