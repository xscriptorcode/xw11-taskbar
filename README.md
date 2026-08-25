<div align="center">

# Windows Xscriptor

Complete collection of Xscriptor customizations for **Windows 11**: status bars
(YASB, Zebar), taskbar themes, PowerShell tooling and more — all with the
Xscriptor palette ecosystem.

[![Windows](https://img.shields.io/badge/Windows-0078D6?logo=windows&logoColor=white)](https://github.com/xscriptor-colors/windows)
[![YASB](https://img.shields.io/badge/YASB-007ACC)](https://github.com/amnweb/yasb)
[![Zebar](https://img.shields.io/badge/Zebar-4B32C3)](https://github.com/glzr-io/zebar)
[![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?logo=powershell&logoColor=white)](https://github.com/PowerShell/PowerShell)
[![CSS](https://img.shields.io/badge/CSS-1572B6?logo=css3&logoColor=fff)](https://developer.mozilla.org/en-US/docs/Web/CSS)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=000)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![MIT](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)

</div>

## Contents

- [Repository Structure](#repository-structure)
- [Quick Install](#quick-install)
- [Usage](#usage)
- [Colors](#colors)
- [Compatibility](#compatibility)
- [License](#license)
- [Related repos](#related-repos)
- [X](#x)

## Repository Structure

- `yasb/`: YASB theme pack — single source layout (`config.yaml`, `themes/`,
  theme switcher, `deploy.ps1`, `generate.py`) plus the archived per-theme
  folders in `yasb/splited/`.
- `zebar/`: Zebar widget packs — `neumorphism/` (soft-UI neumorphic bar with
  popups and 12 switchable palettes) and `xneon/` (liquid-glass backup),
  with `deploy.ps1` and `generate-palettes.py`.
- `windhawk/`: Windhawk mods (planned).
- `oldfiles/`: Legacy taskbar themes and early Windows experiments.

## Quick Install

**Remote one-liner** (Windows 11, PowerShell 5.1+, no git needed) — installs
YASB/Zebar if missing and deploys both theme packs from the repo:

```powershell
irm https://raw.githubusercontent.com/xscriptor-colors/windows/main/windows/install.ps1 | iex
```

**Or clone and deploy locally**:

```powershell
powershell -ExecutionPolicy Bypass -File yasb\deploy.ps1   # YASB (winget install AmN.yasb)
powershell -ExecutionPolicy Bypass -File zebar\deploy.ps1  # Zebar (winget install glzr-io.zebar)
```

Then enable the packs from the Zebar tray icon → *My widgets*.

## Usage

- **Zebar bar**: one neumorphic island per indicator (system, media, disk,
  clock, CPU, memory, traffic, volume, battery, theme). Click any island for
  its detail popup (calendar, controls, usage charts); click the paintbrush
  to cycle the 12 palettes across every widget; click volume to mute.
- **YASB bar**: floating neumorphic islands; `theme_switcher` button cycles
  the 12 theme stylesheets (left = next, right = previous).

## Colors


<div align="center">
  <a href="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_x.svg"><img src="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_x.svg" height="100" alt="X"/></a>
  <a href="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_madrid.svg"><img src="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_madrid.svg" height="100" alt="Madrid"/></a>
  <a href="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_lahabana.svg"><img src="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_lahabana.svg" height="100" alt="Lahabana"/></a>
  <a href="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_miami.svg"><img src="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_miami.svg" height="100" alt="Miami"/></a>
  <a href="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_paris.svg"><img src="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_paris.svg" height="100" alt="Paris"/></a>
  <a href="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_tokio.svg"><img src="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_tokio.svg" height="100" alt="Tokio"/></a>
</div>
<div align="center">
  <a href="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_oslo.svg"><img src="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_oslo.svg" height="100" alt="Oslo"/></a>
  <a href="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_helsinki.svg"><img src="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_helsinki.svg" height="100" alt="Helsinki"/></a>
  <a href="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_berlin.svg"><img src="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_berlin.svg" height="100" alt="Berlin"/></a>
  <a href="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_london.svg"><img src="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_london.svg" height="100" alt="London"/></a>
  <a href="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_praha.svg"><img src="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_praha.svg" height="100" alt="Praha"/></a>
  <a href="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_bogota.svg"><img src="https://raw.githubusercontent.com/xscriptor-colors/assets/main/media/palettes/palette_bogota.svg" height="100" alt="Bogota"/></a>
</div>

## Compatibility

- Windows 11, Komorebi/GlazeWM-friendly.
- Requires the Hack Nerd Font (or any Nerd Font) for icon glyphs.

## License

- Repository code is under the [MIT License](LICENSE).

## Related Repos

- [VSCode](https://github.com/xscriptor-colors/vscode)
- [Terminal](https://github.com/xscriptor-colors/terminal)
- [Nvim](https://github.com/xscriptor-colors/nvim)
- [Jetbrains](https://github.com/xscriptor-colors/jetbrains)

## X

 [![X Web](https://xscriptor.github.io/icons/icons/code/product-design/xsvg/verified-filled.svg)](https://xscriptor.io)
&
[![X Github Profile](https://xscriptor.github.io/icons/icons/code/product-design/xsvg/github.svg)](https://github.com/xscriptor)
&
[![Xscriptor web](https://xscriptor.github.io/icons/icons/code/product-design/xsvg/quotes.svg)](https://www.xscriptor.com)
