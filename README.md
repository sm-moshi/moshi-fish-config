# Fish Shell Configuration

This repository contains the configuration files for the Fish shell, including the setup for Fisher and Tide.

## Structure

- `config.fish`: Main configuration file for Fish shell.
- `functions/`: Directory containing custom Fish functions.
- `conf.d/`: Directory containing configuration modules.
- `fish_variables`: File containing Fish universal variable definitions.

## Installation

1. **Install Fish Shell**:
   ```sh
   sudo apt-get install fish
   ```

2. **Install Fisher**:
   ```sh
   curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
   ```

3. **Install Tide**:
   ```sh
   fisher install ilancosman/tide@v6
   ```

## Configuration

### Main Configuration (`config.fish`)

The main configuration file is structured to mirror Zsh configuration with Fish idioms. It includes:

- Adding function subdirectories to `fish_function_path`.
- Auto-loading all functions in subdirectories.
- Loading configuration modules from `conf.d/`.

### Tide Configuration

Tide is configured with various color settings and prompt items. The configuration is located in `fish_variables`.

### Custom Functions

Custom functions are located in the `functions/` directory and are auto-loaded by the main configuration file.

## Usage

After installation and configuration, start a new Fish shell session to see the changes.

```sh
fish
```

## Contributing

Feel free to open issues or submit pull requests for improvements or bug fixes.

## License

This project is licensed under the MIT License.
