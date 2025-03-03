# ===== Main Fish Shell Configuration =====

# Disable greeting
set -U fish_greeting ""

if status is-interactive
    # Load configurations in dependency order
    set -l configs \
        core.fish \
        dev.fish \
        path.fish \
        tools.fish \
        aliases.fish \
        theme.fish

    for conf in $configs
        test -f $__fish_config_dir/conf.d/$conf; and source $__fish_config_dir/conf.d/$conf
    end
end

# Added by Windsurf
fish_add_path /Users/smeya/.codeium/windsurf/bin
