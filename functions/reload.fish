function reload --description 'Reload fish configuration'
    # Store current directory and important paths
    set -l current_dir $PWD
    set -l home_dir $HOME
    set -l safe_dir $home_dir

    # Function to check if path is safe
    function is_safe_path
        set -l path $argv[1]
        not string match -q "/opt/homebrew*" "$path" \
            && not string match -q "/usr/local*" "$path" \
            && not string match -q "/tmp*" "$path" \
            && test -d "$path" \
            && test -w "$path"
    end

    # Try to find a safe directory to reload in
    if is_safe_path "$current_dir"
        set safe_dir $current_dir
    else if is_safe_path "$home_dir"
        echo "Current directory is restricted, falling back to home directory..."
        set safe_dir $home_dir
    else
        echo "Error: Cannot find a safe directory to reload in."
        return 1
    end

    # Execute new shell in safe directory
    exec fish -C "cd '$safe_dir'"
end
