# Zebar — xscriptor-colors pack

Status bar for [Zebar](https://github.com/glzr-io/zebar) with the same
floating-island look as the YASB themes: neumorphic islands, hairline
highlights and the X palette.

## Install Zebar

```powershell
winget install glzr-io.zebar
```

Requires [WebView2](https://developer.microsoft.com/en-us/microsoft-edge/webview2/)
(usually preinstalled on Windows 11) and a Nerd Font with the *Propo* variant
(e.g. `JetBrainsMono NFP`) for the icons.

## Install the pack

```powershell
powershell -ExecutionPolicy Bypass -File deploy.ps1
```

This copies the pack to `~/.glzr/zebar/xscriptor-colors/`. Then open the Zebar
tray icon → *My widgets* → `xscriptor-colors` → `bar` to run it, and enable
*Run on startup* if you want it on boot.

## Structure

```
zebar/
├── zpack.json       # pack definition (schema from the Zebar repo)
├── deploy.ps1       # installs the pack into ~/.glzr/zebar
├── bar/             # the bar widget (buildless HTML/CSS/JS)
│   ├── index.html
│   ├── styles.css   # X palette as CSS variables
│   └── main.js      # clock (hour + day), CPU, memory via zebar providers
└── README.md
```

## Why web tech

Widgets are native webviews (WebView2/Chromium): full CSS, **SVG** (inline or
`<img>`), JS, canvas, animations, Nerd Fonts — anything a browser does.

## Customization

- **Palette**: edit the `--x-*` variables in `bar/styles.css` — same tokens as
  the YASB themes, same look.
- **Layout**: the islands live in `bar/index.html`; providers are configured in
  `bar/main.js` via `zebar.createProviderGroup`.
- After changes, re-run `deploy.ps1` (or copy the folder yourself) — Zebar
  picks it up on next start.
