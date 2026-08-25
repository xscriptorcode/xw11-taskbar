# Theme switcher — YASB

Cycles the 12 xscriptor-colors themes (`x`, `madrid`, `lahabana`, `miami`,
`paris`, `tokio`, `oslo`, `helsinki`, `berlin`, `london`, `praha`, `bogota`)
straight from the bar. The button is intentionally neutral — dim text, accent
on hover — so it keeps the floating-island look of every theme without ever
clashing with one.

## Files

| File | Purpose |
|---|---|
| `theme-switcher.ps1` | `next` / `prev` / `name` logic |
| `styles.css` | Active stylesheet (starts as X) |
| `styles.<theme>.css` | One stylesheet per theme |

## Install

1. Copy **everything** in this folder into your YASB config directory:
   `C:\Users\{user}\.config\yasb\` (or `$env:YASB_CONFIG_HOME`).
2. Copy the `config.yaml` and `styles.css` of any theme (`x/`, `lahabana/`,
   ...) over it — every theme config already ships the `theme_switcher` widget.
3. Restart YASB from its tray icon.

## Usage

- **Left click**: next theme · **Right click**: previous theme.
- The button label shows the current theme, refreshed every 5 s.
- Switching only overwrites `styles.css`; YASB's `watch_stylesheet` reloads it
  on the spot, no restart needed.

> The widget calls `%USERPROFILE%\.config\yasb\theme-switcher.ps1`. If your
> config directory lives elsewhere (`YASB_CONFIG_HOME`), update the path in
> the `theme_switcher` block of `config.yaml`.
