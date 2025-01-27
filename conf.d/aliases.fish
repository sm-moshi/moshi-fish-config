# Command aliases

alias reload='exec fish'
alias mkcd='mkdir -p $argv; cd $argv'

# Modern replacements
alias ls="eza --long --classify --all --header --git --no-user --tree --level 1"
alias cat="bat"
alias vi="nvim"
alias vim="nvim"
alias find="fd"
alias grep="rg"
alias du="dust"
alias ps="procs"
alias top="btop"
alias sed="sd"

# System maintenance
alias dedup="jdupes -B -N -r -z . && afsctool -vc -9 ."
alias brewup="brew update && brew upgrade --greedy && brew cleanup --prune=all"

# System tools with color
alias ip="ip -color=auto"
alias diff="diff --color=auto"

# Navigation
alias quit="exit"

# URL utilities
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; print (ul.quote_plus(sys.argv[1]))"'

# Shell configuration
alias please=sudo
alias fishrc='$EDITOR (dirname (status --current-filename))/config.fish'

# Quick edit
alias envfile='$EDITOR (dirname (status --current-filename))/conf.d/env.fish'
alias aliasfile='$EDITOR (dirname (status --current-filename))/conf.d/aliases.fish'

# Last command utility
function last-command
    set cmd (history | head -n 1 | string trim)
    if test -z "$cmd"
        echo "No previous command found"
        return 1
    end
    echo "Last command: $cmd"
end
alias last='last-command'
