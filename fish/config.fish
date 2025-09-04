if status is-interactive
    # Starship custom prompt
    starship init fish | source

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


end
