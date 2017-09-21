# tmux-vpn

Display VPN status in [`tmux`](https://tmux.github.io/) status bar.

Supports:

- macOS

## Installing

### Via TPM (recommended)

The easiest way to install `tmux-vpn` is via the [Tmux Plugin
Manager](https://github.com/tmux-plugins/tpm).

1. Add plugin to the list of TPM plugins in `.tmux.conf`:

    ``` tmux
    set -g @plugin 'jamesoff/tmux-vpn'
    ```

2. Use <kbd>prefix</kbd>–<kbd>I</kbd> to install `tmux-vpn`.

3. When you want to update `tmux-vpn` use <kbd>prefix</kbd>–<kbd>U</kbd>.

### Manual Installation

1. Clone the repository

    ``` sh
    $ git clone https://github.com/jamesoff/tmux-vpn ~/clone/path
    ```

2. Add this line to the bottom of `.tmux.conf`

    ``` tmux
    run-shell ~/clone/path/tmux-vpn.tmux
    ```

3. Reload the `tmux` environment

    ``` sh
    # type this inside tmux
    $ tmux source-file ~/.tmux.conf
    ```

## Use

This plugin is hard-coded to check if the gpd0 interface is up.

Edit your `status-left` or `status-right` setting to include one of:

- `#{vpn}` - display the vpn status

Reload your configuration for it to take effect: <kbd>prefix</kbd>-<kbd>R</kbd> with TPM, or

``` sh
$ tmux source-file ~/.tmux.conf
```

