if status is-interactive
    # Starship custom prompt
    starship init fish | source
    zoxide init fish | source
    # Custom colours
    cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end

# Start ssh-agent automatically
if not pgrep -u (whoami) ssh-agent > /dev/null
    eval (ssh-agent -c)
end
ssh-add -q ~/.ssh/id_ed25519 2>/dev/null


# Track last tab press
set -g __last_tab_time 0

function tab-or-accept --description "Tab once = complete, Tab twice quickly = accept suggestion"
    set now (date +%s%3N)  # current time in ms
    set diff (math $now - $__last_tab_time)

    if test $diff -lt 400
        # If pressed again within 400ms -> accept autosuggestion
        commandline -f accept-autosuggestion
        set __last_tab_time 0
    else
        # Normal tab completion
        commandline -f complete
        set __last_tab_time $now
    end
end

bind \t tab-or-accept


# ----------------------------
# 🌊 Fish Aliases
# ----------------------------

alias led="openrgb --profile $(caelestia wallpaper | sed -E 's#.*/(.*)\.(png|jpg|jpeg)$#\1#')"
alias cl="clear"
# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'

# System
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias cleanup='sudo pacman -Rns $(pacman -Qdtq)'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Config quick access
alias cf='cd ~/.config/fish'
alias ch='cd ~/.config/hypr'
alias cc='cd ~/.config/caelestia'

# Utilities
alias ls='lsd -l --color=auto'
alias ll='lsd -lh'
alias la='lsd -a'
alias grep='grep --color=auto'

#shortcuts
alias hycof='code ~/.config/hypr'
alias ficof='code ~/.config/fish'
alias shellcof='code ~/.config/caelestia'
end
