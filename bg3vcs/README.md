# bg3vcs

A tool to help manage version control for Baldur's Gate 3 mod projects.

## Installation

These tools are mainly intended for use with Windows so priority support goes to installing with Winget but installing via `go install` _should_ work on other platforms. MacOS and Linux are not regularly tested however. 

### Using winget

```sh
winget install HibiscusMods.BG3Toolkit.VCS
```

### Using go

```sh
go install mods.hibiscusgames.com/bg3tk/vcs@latest
```

### From source

See [building from source below](#building-from-source)

## Usage

## Configuration

bg3vcs uses [Viper](https://github.com/spf13/viper) for configuration. The configuration file can by set in multiple places. 
The order of precedence from highest to lowest is:

- Command line flags.
- Environment variables.
- In a `.bg3vcs.yaml` config file in the working directory.
- In a user level configuration at `%USERPROFILE%/.config/bg3tk/vcs.yaml` / `~/.config/bg3tk/vcs.yaml`.
- Remote key/value store.

See the [configuration options](https://github.com/HibiscusMods/bg3tk/wiki/bg3vcs/configuration.md) page for the full list of options.

## Building from source

[Mise-en-place](https://mise.jdx.dev/getting-started.html) is the supported way to build bg3vcs from source on all platforms. Windows is the only officially tested platform however.

```sh
# 1. Clone the repository
git clone https://github.com/HibiscusMods/bg3tk.git
# 2. Install prerequisites and set up the development environment
mise install 
# 3. Run all tests to confirm everything is correctly set up.
mise run bg3vcs:test
# 4. Build and run the app from source
mise run bg3vcs
# 5. Install the app to your system
mise run bg3vcs:install
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to contribute to the project.

## License

This tool is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgements

**The team at [Larian Studios](https://larian.com/)** for their amazing work creating [Baldur's Gate 3](https://baldursgate3.game/) and releasing the BG3 Toolkit to the public.

**[Steve Francia aka spf13](https://github.com/spf13) and the [Cobra](https://github.com/spf13/cobra/graphs/contributors) & [Viper](https://github.com/spf13/viper/graphs/contributors) communities** for making writing robust CLI applications in golang a breeze.

**[aka jdx](https://github.com/jdx) and the [mise-en-place community](https://github.com/jdx/mise/graphs/contributors)** for the smoothest package management / environment and task runner experience I've used so far.