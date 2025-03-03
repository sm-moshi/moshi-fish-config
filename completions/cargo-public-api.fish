# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_cargo_public_api_global_optspecs
	string join \n manifest-path= p/package= s/simplified omit= F/features= all-features no-default-features target= color= rustdoc-json= verbose debug-sorting target-dir= cap-lints= h/help V/version
end

function __fish_cargo_public_api_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_cargo_public_api_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_cargo_public_api_using_subcommand
	set -l cmd (__fish_cargo_public_api_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -l manifest-path -d 'Path to `Cargo.toml`' -r -F
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -s p -l package -d 'Name of package in workspace to list or diff the public API for' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -l omit -d 'Omit specified items' -r -f -a "blanket-impls\t'Omit items that belong to Blanket Implementations such as `impl<T> Any for T`, `impl<T> Borrow<T> for T`, and `impl<T, U> Into<U> for T where U: From<T>`'
auto-trait-impls\t'Omit items that belong to Auto Trait Implementations such as `impl Send for ...`, `impl Sync for ...`, and `impl Unpin for ...`'
auto-derived-impls\t'Omit items that belong to Auto Derived Implementations such as `Clone`, `Debug`, and `Eq`'"
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -s F -l features -d 'Space or comma separated list of features to activate' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -l target -d 'Build for the target triple' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -l color -d 'When to color the output' -r -f -a "auto\t'Colors will be used if stdout is a terminal. Colors will not be used if stdout is a regular file'
never\t'Colors will never be used'
always\t'Colors will always be used'"
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -l rustdoc-json -d 'List the public API based on the given rustdoc JSON file' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -l target-dir -d 'Where to put rustdoc JSON build artifacts' -r -F
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -l cap-lints -d 'Forwarded to rustdoc JSON build command' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -s s -l simplified -d 'Omit noisy items. Can be used more than once.'
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -l all-features -d 'Activate all available features'
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -l no-default-features -d 'Do not activate the `default` feature'
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -l verbose -d 'Show detailed info about processing'
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -l debug-sorting -d 'Show the hidden "sorting prefix" that makes items nicely grouped'
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -s V -l version -d 'Print version'
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -f -a "diff" -d 'Diff the public API against a published version of the crate, or between commits.'
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -f -a "completions" -d 'Generate completion scripts for many different shells.'
complete -c cargo-public-api -n "__fish_cargo_public_api_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l deny -d 'Exit with failure if the specified API diff is detected' -r -f -a "all\t'All forms of API diffs are denied: additions, changes, deletions'
added\t'Deny added things in API diffs'
changed\t'Deny changed things in API diffs'
removed\t'Deny removed things in API diffs'"
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l manifest-path -d 'Path to `Cargo.toml`' -r -F
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -s p -l package -d 'Name of package in workspace to list or diff the public API for' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l omit -d 'Omit specified items' -r -f -a "blanket-impls\t'Omit items that belong to Blanket Implementations such as `impl<T> Any for T`, `impl<T> Borrow<T> for T`, and `impl<T, U> Into<U> for T where U: From<T>`'
auto-trait-impls\t'Omit items that belong to Auto Trait Implementations such as `impl Send for ...`, `impl Sync for ...`, and `impl Unpin for ...`'
auto-derived-impls\t'Omit items that belong to Auto Derived Implementations such as `Clone`, `Debug`, and `Eq`'"
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -s F -l features -d 'Space or comma separated list of features to activate' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l target -d 'Build for the target triple' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l color -d 'When to color the output' -r -f -a "auto\t'Colors will be used if stdout is a terminal. Colors will not be used if stdout is a regular file'
never\t'Colors will never be used'
always\t'Colors will always be used'"
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l rustdoc-json -d 'List the public API based on the given rustdoc JSON file' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l target-dir -d 'Where to put rustdoc JSON build artifacts' -r -F
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l cap-lints -d 'Forwarded to rustdoc JSON build command' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l force -d 'Force the diff. For example, when diffing commits, enabling this option will discard working tree changes during git checkouts of other commits'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -s s -l simplified -d 'Omit noisy items. Can be used more than once.'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l all-features -d 'Activate all available features'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l no-default-features -d 'Do not activate the `default` feature'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l verbose -d 'Show detailed info about processing'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -l debug-sorting -d 'Show the hidden "sorting prefix" that makes items nicely grouped'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand diff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -l manifest-path -d 'Path to `Cargo.toml`' -r -F
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -s p -l package -d 'Name of package in workspace to list or diff the public API for' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -l omit -d 'Omit specified items' -r -f -a "blanket-impls\t'Omit items that belong to Blanket Implementations such as `impl<T> Any for T`, `impl<T> Borrow<T> for T`, and `impl<T, U> Into<U> for T where U: From<T>`'
auto-trait-impls\t'Omit items that belong to Auto Trait Implementations such as `impl Send for ...`, `impl Sync for ...`, and `impl Unpin for ...`'
auto-derived-impls\t'Omit items that belong to Auto Derived Implementations such as `Clone`, `Debug`, and `Eq`'"
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -s F -l features -d 'Space or comma separated list of features to activate' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -l target -d 'Build for the target triple' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -l color -d 'When to color the output' -r -f -a "auto\t'Colors will be used if stdout is a terminal. Colors will not be used if stdout is a regular file'
never\t'Colors will never be used'
always\t'Colors will always be used'"
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -l rustdoc-json -d 'List the public API based on the given rustdoc JSON file' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -l target-dir -d 'Where to put rustdoc JSON build artifacts' -r -F
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -l cap-lints -d 'Forwarded to rustdoc JSON build command' -r
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -s s -l simplified -d 'Omit noisy items. Can be used more than once.'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -l all-features -d 'Activate all available features'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -l no-default-features -d 'Do not activate the `default` feature'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -l verbose -d 'Show detailed info about processing'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -l debug-sorting -d 'Show the hidden "sorting prefix" that makes items nicely grouped'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand completions" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand help; and not __fish_seen_subcommand_from diff completions help" -f -a "diff" -d 'Diff the public API against a published version of the crate, or between commits.'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand help; and not __fish_seen_subcommand_from diff completions help" -f -a "completions" -d 'Generate completion scripts for many different shells.'
complete -c cargo-public-api -n "__fish_cargo_public_api_using_subcommand help; and not __fish_seen_subcommand_from diff completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
