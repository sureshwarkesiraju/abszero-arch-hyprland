#!/usr/bin/env bash
# restore-layout.sh - spawn tiling/overlay apps including rmpc and cava
# small sleeps give Hyprland time to create windows so windowrules apply reliably

sleep 3

# your existing apps (keep original classes)
/usr/bin/kitty --class ffa   -e sh -c "/home/absolutezero/.local/bin/fastfetch-auto; exec zsh" &
/usr/bin/kitty --class tty   -e sh -c "tty-clock -S -b -n -C 2; exec zsh" &
/usr/bin/kitty --class htop  -e sh -c "btm --basic; exec zsh" &
/usr/bin/kitty --class matrix -e sh -c "cmatrix; exec zsh" &

# small gap so the first kitty windows are created
sleep 0.35

# launch rmpc in a floating kitty with explicit class so Hyprland rules can match it
/usr/bin/kitty --class rmpc-player -o background_opacity=0.65 -e rmpc &

# short delay so rmpc window exists before launching cava
sleep 0.25

# launch cava in a thin floating kitty panel
/usr/bin/kitty --class cava-panel -o background_opacity=0.65 -o font_size=11 -e cava &

# give windows a moment to show up and for Hyprland to apply windowrules
sleep 0.6

exit 0
