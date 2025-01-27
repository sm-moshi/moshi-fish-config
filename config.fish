# Main Fish shell configuration file

# Reset working directory if in system paths
if string match -q "/opt/homebrew/*" "$PWD"
    cd $HOME
end

if status is-interactive
    set -l config_dir (dirname (status --current-filename))

    # Function to safely load configuration files
    function load_config --argument-names file
        set -l config_path $config_dir/$file
        if test -f $config_path
            source $config_path
        else
            echo "Warning: Configuration file $file not found"
        end
    end

    # Add function paths
    for dir in $config_dir/functions/*/
        if test -d $dir
            set -ga fish_function_path $dir
        end
    end

    # Load core configurations in order
    set -l configs env.fish path.fish programming.fish asdf.fish plugins.fish aliases.fish
    for conf in $configs
        load_config conf.d/$conf
    end

    # Cleanup
    functions -e load_config
end
