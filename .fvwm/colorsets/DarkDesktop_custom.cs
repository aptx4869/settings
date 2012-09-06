# DarkDesktop colorset
# Written by: fRiQ

SetEnv Colorset-Name "DarkDesktop"
SetEnv Colorset-Author "fRiQ"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[cs-quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 70


Colorset $[cs-panel-inactive] \
Foreground "white", Background "#444444", \
Tint "black" 10, RootTransparent, \
fgTint, IconAlpha, IconTint

Colorset $[cs-panel-active] \
Foreground "darkgray", Background "darkgray", \
Hilight "darkgray", Shadow "darkgray", \
Tint "#000066" 10, RootTransparent

Colorset $[cs-panel-wininactive] \
Foreground "gray", Background "#777777", \
Hilight "#444444", Shadow "#444444", \
Tint "black" 10, RootTransparent

Colorset $[cs-panel-winactive] \
Foreground "white", Background "#777777", \
Hilight "#666666", Shadow "#666666", \
Tint "blue" 10, RootTransparent

Colorset $[cs-panel-border] \
Background "#777777"

Colorset $[cs-menu-inactive] \
Foreground "white", Background "#777777", \
Hilight "#777777", Shadow "#777777", \
Tint "black" 10, RootTransparent

Colorset $[cs-menu-active] \
Foreground "black", Background "gray", \
Hilight "black", Shadow "gray"


# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "gray"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0x000000"
SetEnv TrayerAlpha "128"

