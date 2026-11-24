# octal-perm.yazi

A simple [Yazi](https://github.com/sxyazi/yazi) plugin that displays octal file permissions in the status bar.

## Features

- Display octal permissions alongside the original symbolic permissions.
- Preserve Yazi's built-in permission colors.
- Use three-digit octal notation (`755`, `644`, `600`).
- Keep the original `rwxr-xr-x` representation.

### Preview

```text
755 rwxr-xr-x
644 rw-r--r--
600 rw-------
```

## Installation

Install using Yazi's package manager:

```bash
ya pkg add 17257520/octal-perm
```

## Configuration

Add the following line to your `~/.config/yazi/init.lua`:

```lua
require("octal-perm"):setup()
```

Restart Yazi to apply the changes.

## How It Works

The plugin extends Yazi's status bar permission display by adding the octal permission value before the original symbolic representation.

For example:

| Before      | After           |
| ----------- | --------------- |
| `rwxr-xr-x` | `755 rwxr-xr-x` |
| `rw-r--r--` | `644 rw-r--r--` |
| `rw-------` | `600 rw-------` |

The octal value is derived from the file's permission mode.

## Requirements

- [Yazi](https://github.com/sxyazi/yazi)
- Yazi version with Lua plugin support

## License

[MIT License](LICENSE)
