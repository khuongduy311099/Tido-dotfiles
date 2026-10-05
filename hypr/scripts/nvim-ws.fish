#!/usr/bin/env fish

# `windowrule = workspace` is static: Hyprland only evaluates it when a window is
# mapped, so a terminal that starts nvim later never matches. Watch title changes
# instead and move the window ourselves.

set -l target_ws 4
set -l terminals kitty alacritty foot

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -l event
    string match -q 'windowtitlev2>>*' -- $event; or continue

    set -l payload (string split -m 1 '>>' -- $event)[2]
    set -l fields (string split -m 1 ',' -- $payload)
    set -l address 0x$fields[1]
    set -l title $fields[2]

    string match -qr '^(nvim|edit)(\s|$)' -- $title; or continue

    set -l window (hyprctl clients -j | jq -r --arg a $address '.[] | select(.address == $a) | "\(.class)\t\(.workspace.id)"')
    set -l fields (string split \t -- $window)
    contains -- $fields[1] $terminals; or continue
    test "$fields[2]" = "$target_ws"; and continue

    hyprctl dispatch movetoworkspace $target_ws,address:$address
end
