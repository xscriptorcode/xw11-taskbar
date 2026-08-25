# Islands themes for Windows 11 Taskbar Styler

**Author**: [xscriptorcode](https://github.com/xscriptorcode)

Island-style taskbar themes for Windows 11 created with the Windhawk mod
**Taskbar Styler**. Each app button and the system tray are separate rounded
"islands" filled with the palette's `background` color, floating over a
transparent taskbar — the accent color of each palette appears on the clock,
tray text, labels and the running indicator.

12 palettes, one theme per file in this folder:

| File                  | Accent    | Background |
| --------------------- | --------- | ---------- |
| `x.json`              | `#fce566` | `#050505`  |
| `madrid.json`         | `#990026` | `#fafafa`  |
| `lahabana.json`       | `#e5ff9d` | `#19191a`  |
| `miami.json`          | `#ff4c8b` | `#000000`  |
| `paris.json`          | `#c4bdff` | `#1a0a30`  |
| `tokio.json`          | `#fd9353` | `#1c1c1d`  |
| `oslo.json`           | `#4dc4ff` | `#3f4451`  |
| `helsinki.json`       | `#1faa9e` | `#f8fafe`  |
| `berlin.json`         | `#cccccc` | `#000000`  |
| `london.json`         | `#333333` | `#ffffff`  |
| `praha.json`          | `#bd93f9` | `#1a1a1a`  |
| `bogota.json`         | `#47e6ff` | `#200b0a`  |

---

# Required Mod: Taskbar Height and Icon Size

The island look depends on a **compact taskbar** with **medium icons**. Install
the **Taskbar Height and Icon Size** mod in Windhawk and apply the settings
below (in its **Advanced** tab → *Mod settings*), or paste the included
[`taskbar-height-icon-size.json`](taskbar-height-icon-size.json).

```json
{"IconSize":20,"TaskbarHeight":34,"TaskbarButtonWidth":31,"IconSizeSmall":38}
```

---

# Manual Installation

1. Make sure [Windhawk](https://windhawk.net/) is installed.
2. Install the **Windows 11 Taskbar Styler** mod and the
   **Taskbar Height and Icon Size** mod (see above).
3. Open **Taskbar Styler** → **Advanced** tab.
4. Paste the JSON content of your chosen theme (e.g. `x.json`) in the
   *Mod settings* section and click **Save**.
5. Restart Explorer (if necessary) for the changes to take full effect.

The themes are generated from the canonical palettes by
[`taskbar/generate.py`](../generate.py).

---

# Notes

- The Start button is hidden in every theme.
- Designed for dark setups, but light palettes (Madrid, Helsinki, London)
  keep their own light `background` with a dark accent.
- Requires the Hack Nerd Font (or any Nerd Font) for icon glyphs.
- For running app labels, combine with the **Taskbar Labels for Windows 11**
  mod.
