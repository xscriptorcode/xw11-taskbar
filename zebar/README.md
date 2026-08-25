# Zebar — xscriptor-colors packs

Status bar packs for [Zebar](https://github.com/glzr-io/zebar). Each subfolder
is a self-contained pack (has its own `zpack.json`), mirroring what lives in
`~/.glzr/zebar/`.

## Packs

| Folder | Pack id | Design |
|---|---|---|
| `neumorphism/` | `xscriptor-colors-neumorphism` | Soft-UI neumorphism (extruded panel, recessed islands), 12 switchable palettes, 9 indicators |
| `xneon/` | `xneon` | Liquid-glass islands — saved copy of an earlier design |

`neumorphism/` indicators: clock (hour + day), system (host · IP · keyboard
layout), media, disk, CPU, memory, traffic (down/up), volume (click to mute)
and battery — with a paint-brush island that cycles the 12 palettes.

## Install Zebar

```powershell
winget install glzr-io.zebar
```

Requires [WebView2](https://developer.microsoft.com/en-us/microsoft-edge/webview2/)
(usually preinstalled on Windows 11) and the Hack Nerd Font (or any Nerd Font).

## Deploy

```powershell
powershell -ExecutionPolicy Bypass -File deploy.ps1
```

Copies every pack into `~/.glzr/zebar/` (same folder names, backups as
`<name>.bak`). Then run it from the Zebar tray icon → *My widgets*.

## Customization

- **Palette**: the bar's CSS variables are themeable at runtime
  (`palettes.js`). Regenerate it after adding a palette to the canonical
  `yasb/generate.py` PALETTES:

  ```powershell
  python generate-palettes.py
  ```

- **Look & layout**: edit `neumorphism/styles.css` and `neumorphism/index.html`.
  The neumorphic recipe lives in `styles.css` — dual soft shadows (light
  top-left / dark bottom-right), same-surface colors, inset bevels for the
  recessed islands and meters.

- Widget files are kept flat at each pack root (like the starter pack): Zebar's
  asset server only serves files matching the `includeFiles` globs, and Rust
  globs do not cross path separators.
