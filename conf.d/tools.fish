# ===== Tools and Plugin Configuration =====

# Homebrew Settings
set -gx HOMEBREW_CASK_OPTS "--appdir=~/Applications"
set -gx HOMEBREW_MAKE_JOBS 10

# ======== Shell UI Configuration ========
# Shell colors for better visibility
set -g fish_color_autosuggestion 555 # Subtle suggestions
set -g fish_color_command blue # Clear command highlighting
set -g fish_color_error red # Obvious errors
set -g fish_color_param cyan # Distinct parameters
set -g fish_color_quote green # Readable quotes
set -g fish_color_search_match --background=blue

# Key bindings
bind -k up history-search-backward
bind -k down history-search-forward

# ======== Plugin Configuration ========
# FZF configuration
if type -q fzf
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
    set -gx FZF_DEFAULT_OPTS '--height 50% --layout=reverse --border --cycle'

    # Use fd for directory searching
    set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'

    # Use eza for previews if available
    if type -q eza
        set -gx fzf_preview_dir_cmd 'eza --all --color=always'
    end

    # Key bindings
    bind \cf __fzf_search_current_dir
    bind \cr __fzf_search_history
    bind \cv __fzf_search_git_log
end

# fish-bax (bash compatibility)
if type -q bax
    set -g BAX_DEBUG 0
    set -g BAX_SAVE_VARS PATH
end
