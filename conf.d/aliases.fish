# Modern replacements
set -l modern_tools \
    "ls=eza --long --classify --all --header --git --no-user --tree --level 1" \
    "cat=bat" \
    "vi=nvim" \
    "vim=nvim" \
    "find=fd" \
    "grep=rg" \
    "du=dust" \
    "ps=procs" \
    "top=btop" \
    "sed=sd"

for tool in $modern_tools
    alias (string split "=" $tool)
end

# System utilities
alias mkcd='mkdir -p $argv; cd $argv'
alias dedup="jdupes -B -N -r -z . && afsctool -vc -9 ."
alias brewup="brew update && brew upgrade && brew cleanup --prune=all && brew autoremove && brew doctor"

# System tools with color
alias ip="ip -color=auto"
alias diff="diff --color=auto"

# Navigation
alias quit="exit"

# URL utilities
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; print (ul.quote_plus(sys.argv[1]))"'

# Configuration shortcuts
set -l config_dir (dirname (status --current-filename))
alias fishrc="$EDITOR $config_dir/config.fish"
alias envfile="$EDITOR $config_dir/conf.d/env.fish"
alias aliasfile="$EDITOR $config_dir/conf.d/aliases.fish"

# Shell configuration
alias please=sudo

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
