# ===== eza Functions =====

# Function: ls
# Description: Lists directory entries using eza with detailed options.
functions -e ls 2>/dev/null
function ls
    command eza --long --classify --all --header --git --no-user --tree --level 1 --group-directories-first --icons --color=always $argv
end

# Function: ll
# Description: Provides a detailed long listing of directory entries with eza.
function ll
    command eza --long --classify --all --header --git --no-user --group-directories-first --icons --color=always $argv
end

# Function: lt
# Description: Displays a tree view of the directory structure using eza.
function lt
    command eza --tree --level=2 --long --git-ignore --color=always $argv
end

# Function: lm
# Description: Lists directory entries sorted by last modification time.
function lm
    command eza --long --sort=modified --color=always $argv
end

# Function: lsize
# Description: Lists directory entries sorted by file size.
function lsize
    command eza --long --sort=size --color=always $argv
end
