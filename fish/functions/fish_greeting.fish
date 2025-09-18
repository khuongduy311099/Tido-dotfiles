function fish_greeting
    echo -ne '\x1b[38;5;16m'  # Set colour to primary
    fortune | cowsay -r

    set_color normal
    fastfetch --key-padding-left 5
end
