# Main Fish shell configuration file
# Structured to mirror Zsh configuration with Fish idioms

if status is-interactive
    # Add function subdirectories to fish_function_path
    for dir in (dirname (status --current-filename))/functions/*/
        if test -d $dir
            set -ga fish_function_path $dir
        end
    end

    # Auto-load all functions in subdirectories
    for f in (dirname (status --current-filename))/functions/*/*.fish
        source $f
    end

    # Load configuration modules
    # These are organized similar to your Zsh setup
    source (dirname (status --current-filename))/conf.d/env.fish
    source (dirname (status --current-filename))/conf.d/path.fish
    source (dirname (status --current-filename))/conf.d/programming.fish
    source (dirname (status --current-filename))/conf.d/asdf.fish
    source (dirname (status --current-filename))/conf.d/plugins.fish
    source (dirname (status --current-filename))/conf.d/aliases.fish
    # Remove tide.fish source line
end
