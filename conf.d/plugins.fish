# Configure built-in features that replace Zsh plugins

# Configure fish's built-in autosuggestions (replaces zsh-autosuggestions)
set -g fish_color_autosuggestion 555 # Subtle gray
set -g fish_color_search_match --background=blue

# History search (replaces zsh-history-substring-search)
bind -k up history-search-backward
bind -k down history-search-forward

# Enable syntax highlighting (built into fish)
set -g fish_color_command blue
set -g fish_color_param cyan
set -g fish_color_error red
set -g fish_color_quote green

# Plugin and tool initialization

# Add ASDF initialization if installed
if test -f $HOME/.asdf/asdf.fish
    source $HOME/.asdf/asdf.fish
end

# Initialize zoxide if installed
if type -q zoxide
    zoxide init fish | source
end

# fzf.fish configuration
if type -q fzf
    # Set key bindings for file search
    bind \cf __fzf_search_current_dir
    bind \cr __fzf_search_history
    bind \cv __fzf_search_git_log

    # Remove the fzf_complete binding as it's not available
    # bind \t fzf_complete

    # Configure fzf defaults
    set -gx fzf_complete_opts --multi --reverse --inline-info
    set -gx fzf_fd_opts --hidden --exclude=.git
    set -gx fzf_preview_dir_cmd eza --all --color=always

    # Use fd instead of find for better performance
    set -g fzf_find_file_command "fd --type f . \$dir"

    # Use Fish's native tab completion instead of fzf for commands
    set -g fzf_complete 0
end

# fish-bax configuration (enhanced bash compatibility)
if type -q bax
    set -g BAX_DEBUG 0 # Disable debug output
    set -g BAX_SAVE_VARS PATH # Save PATH between bax invocations
end

# fish-sodope configuration (enhance directory navigation)
set -g SODOPE_CD_COMMAND z # Use z (zoxide) as the change directory command

# GRC colorizer configuration
if type -q grc
    set -U grc_plugin_execs cat cvs df diff dig gcc g++ ls ifconfig \
        make mount mtr netstat ping ps tail traceroute \
        wdiff blame head nl env ip addr
end

# Load Fisher plugins
if test -f (dirname (status --current-filename))/fish_plugins
    fisher update
end
