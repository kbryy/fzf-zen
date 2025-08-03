# fzf-zen

**English** | [日本語](docs/README_ja.md)

Comfortable file searching with centered popups.
A Fish shell plugin designed for natural sight line terminal operations.

## Philosophy

**"Minimizing physical and cognitive stress in terminal operations"**

File searching is one of the most frequent operations in a developer's daily workflow. However, traditional methods force us to judge files by filename alone, while constantly looking at small text at the edge of the screen puts ongoing strain on our necks and eyes.

fzf-zen addresses this by placing everything in the center of the screen and providing large previews for instant content verification, making search time not only comfortable but significantly shorter.

### Three Design Principles
- **Zero Configuration**: Works optimally right after installation
- **Centered Focus**: Natural sight line positioning
- **Preview First**: Always verify content before selection with syntax highlighting for quick comprehension

## Quick Start

```fish
fisher install kbryy/fzf-zen
```

## Key Bindings

| Key      | Function         | Action                  |
| -------- | ---------------- | ----------------------- |
| `Ctrl+O` | File search      | ripgrep + bat preview   |
| `Ctrl+R` | History search   | Search command history  |
| `Ctrl+T` | Directory nav    | Tree preview navigation |
| `Ctrl+G` | GHQ repositories | Quick repo switching    |

## Requirements

**Essential**: `fzf` `ripgrep` `bat` `tree`
**Optional**: `ghq` (for Ctrl+G)

```bash
# macOS
brew install fzf ripgrep bat tree ghq

# Ubuntu/Debian
apt install fzf ripgrep bat tree
```

## Customization

```fish
set -g FZF_ZEN_POPUP_SIZE "90%,80%"        # Popup size (default: "70%,75%")
set -g FZF_ZEN_PREVIEW_WINDOW "right:50%"  # Preview position (default: "right:60%")
```

## Contributing

We welcome contributions to this project! Here are ways you can help:

### How to Contribute
- **Bug Reports**: Report bugs via [Issues](https://github.com/kbryy/fzf-zen/issues)
- **Feature Requests**: Propose new features and improvements through Issues
- **Pull Requests**: Submit code for bug fixes and new features
- **Documentation**: Improve README and usage examples

### Getting Started with Development
1. Fork this repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'feat: add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Create a Pull Request

## License

MIT License
