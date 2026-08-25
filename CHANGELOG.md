<h1>Changelog</h1>


All notable changes to this repository will be documented in this file.

---

## [2026-08-25]

### Added
- **`windhawk/` taskbar themes** (Taskbar Styler JSON): three layouts —
  `dock/` (floating centered dock pill, apps without boxes),
  `islands/` (floating rounded islands), `translucid/` (legacy transparent).
  Each layout ships one variant per palette (X, Madrid, Lahabana, Miami,
  Paris, Tokio, Oslo, Helsinki, Berlin, London, Praha, Bogota) with its own
  differentiating accent color (borders, running indicator, clock, tray text,
  labels) and the palette `background` color; Start button hidden.
- **`windhawk/taskbar/generate.py`**: regenerates the `dock/` themes from the
  canonical `yasb/generate.py` palettes.
- **Dock/islands `README.md` + `taskbar-height-icon-size.json`**: per-layout
  docs and the required **Taskbar Height and Icon Size** mod settings
  (dock: 16/55/40/30; islands: 20/34/31/38).
- **`windhawk/README.md`**: overview of the three layouts and setup steps.
- **Per-pack remote installers** (`yasb/install.ps1`, `zebar/install.ps1`):
  remote bootstrap — downloads the latest repo snapshot (codeload zip, no git
  required) and runs the corresponding deploy; usable as a one-liner
  `irm ... | iex` on Windows 11; locates the repo root regardless of the archive
  nesting; `-SkipApps` / `-Keep` flags.
- **Zebar pack `xscriptor-colors-neumorphism`** (`zebar/neumorphism/`): soft-UI neumorphic status bar (extruded panel, recessed islands, dual soft shadows, inset bevels) with runtime theme switching across all 12 palettes.
- **12 palettes** as a shared `palettes.js` (X, Madrid, Lahabana, Miami, Paris, Tokio, Oslo, Helsinki, Berlin, London, Praha, Bogota) with derived surface/high/low/text colors generated from the canonical `yasb/generate.py` source.
- **Per-indicator popups** in the bar: click any island to open its detail widget — calendar (clock), system (host/IP/location/layout), media (with prev/play/next controls), disk (per-disk usage), CPU (usage/frequency/cores/vendor), memory (RAM + swap), traffic (interface, speeds, totals), battery (charge/state/health/cycles). Closed with Esc or clicking the island again.
- **`zebar/xneon/`** pack: liquid-glass island design (aurora glows, rotating conic edge) with the same indicator set, kept as a backup of the earlier design.
- **`zebar/deploy.ps1`**: deploys every pack subfolder to `~/.glzr/zebar` with `.bak` backups.
- **`zebar/generate-palettes.py`**: regenerates `palettes.js` from the canonical palettes.
- **`yasb/` reorganization**: single-source layout (`config.yaml` + `themes/` + `theme-switcher.ps1` + `deploy.ps1` + `generate.py`); previous per-theme folders moved to `yasb/splited/`.
- `.gitignore` (`__pycache__/`, `*.py[cod]`).

### Updated
- **YASB theme set**: generated 12 paletted variants of the X theme, plus a `theme_switcher` bar button (left = next theme, right = previous) backed by `theme-switcher.ps1` and hot-reload via `watch_stylesheet`.
- **Zebar bar layout**: dock-style centered pill (`fit-content`) at 50% window width; compact height (32px window, 22px islands, 3px meters).
- **Fonts**: moved to `Hack Nerd Font` (the installed family) for reliable glyph rendering.
- **Zebar API**: pinned `esm.sh/zebar@3.0` → `zebar@3.3.1` (the installed version) — `startWidget`, media controls and volume control now work.
- **Pack structure**: widget files kept flat at pack root and `includeFiles` widened to `["*.html", "*.css", "*.js"]` to match Zebar's asset-server glob rules.
- **Monitors**: bar preset now targets `all` monitors.

### Fixed
- **YASB deploy encoding**: `deploy.ps1` read `config.yaml` with the ANSI codepage, corrupting UTF-8 chars (`·`, `°`) into `Â·`/`°C` mojibake — now reads `-Encoding UTF8` and writes UTF-8 without BOM.
- **YASB CPU histogram**: `histogram_icons` were single-quoted YAML, so `\u2581` showed as literal text — now double-quoted and decoded to real block glyphs.
- **Zebar "HTML file not found"**: `htmlPath` pointed at a subdirectory (`./bar/index.html`) that the asset server cannot serve (Rust globs do not cross separators) — files flattened to pack root.
- **Zebar theme switcher**: `run_cmd` path with quotes never expanded `%USERPROFILE%` (YASB splits `run_cmd` on spaces) — unquoted path + real config-dir rewrite in `deploy.ps1`.

### Removed
- **`oldfiles/`**: deleted — legacy taskbar themes and early Windows
  experiments superseded by the `windhawk/` taskbar themes.

## [2026-08-24]

### Added
- `x/yasb/` base theme (X palette) for YASB — Windhawk + YASB Windows 11 customization with neumorphic floating islands.
