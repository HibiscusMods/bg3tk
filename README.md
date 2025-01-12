# BG3 Toolkit Monorepo

This monorepo contains tools and utilities for Baldur's Gate 3 modding.

## Modules

### VCS Integration (`vcs-integration/`)
A tool to manage the integration between the BG3 toolkit and version control systems. This module helps streamline the workflow between the BG3 toolkit and your preferred VCS.

### Installation

The recommended installation method is using Winget or mise-en-place.

### Winget
```sh
# List available packages
winget search HibiscusMods.BG3Toolkit

# Install a package
winget install HibiscusMods.BG3Toolkit.{{package}}
```

### mise-en-place
```sh
mise use go:mods.hibiscusgames.com/bg3tk/{{package}}
```
