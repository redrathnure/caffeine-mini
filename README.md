# Caffeine Mini

A 'Caffeine' for KDE, minimalistic version. Just emulates key periodic key pressing to prevent OS going sleep. Uses minimum dependencies (no python and other heavy stuff). Should work with Kubuntu and Debian based Linux as well as Arch Linux. Tested with Plasma 5.x however should work with Plasma 6.x too. Supports the both X11 and Wayland servers.

## Configuration

Checkout repo and read `./setup` help:

```
cd /tmp
git clone https://github.com/redrathnure/caffeine-mini
cd caffeine-mini
./setup --help
```

Install a widget via `./setup install` or `/setup install --mode=bright`.

May be removed using `./setup uninstall` command.

## Credits

Big thanks for:

- [Chandler DeLoach](https://github.com/deloachcd) for the [caffeine-minus](https://github.com/deloachcd/caffeine-minus.git) idea
- KDE team for <https://develop.kde.org/docs/plasma/widget>
