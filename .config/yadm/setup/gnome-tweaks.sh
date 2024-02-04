# Caps to Escape on Wayland, only needs to be done once
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
