# Windhawk

Taskbar themes for Windows 11 built with the
[**Windows 11 Taskbar Styler**](https://windhawk.net/mods/windows-11-taskbar-styler)
Windhawk mod. All themes share the Xscriptor palette ecosystem — one variant
per palette (X, Madrid, Lahabana, Miami, Paris, Tokio, Oslo, Helsinki,
Berlin, London, Praha, Bogota), each with its own differentiating accent
color and the palette `background` color.

## Layouts

There are three taskbar layouts, each with its own folder and README:

| Folder        | Style                                                                 |
| ------------- | --------------------------------------------------------------------- |
| [`dock/`](taskbar/dock/README.md)        | Floating centered dock pill — apps sit directly on the bar, no boxes  |
| [`islands/`](taskbar/islands/README.md)  | Each app button and the tray are separate rounded "islands" floating over a transparent taskbar |
| [`translucid/`](taskbar/translucid/)     | Fully transparent taskbar (legacy styles)                             |

Every layout ships 12 palette variants (`x.json`, `madrid.json`, …) as JSON
that you paste into **Taskbar Styler → Advanced → Mod settings**.

## Getting Started

1. Install [Windhawk](https://windhawk.net/).
2. Install the **Windows 11 Taskbar Styler** mod.
3. Install **Taskbar Height and Icon Size** — required by `dock/` and
   `islands/` for the correct proportions (each folder includes its own
   `taskbar-height-icon-size.json`).
4. Open **Taskbar Styler** → **Advanced** tab, paste the JSON of the palette
   you want, and click **Save**.
5. Restart Explorer (if necessary).

## Structure

- `taskbar/dock/` — dock-layout themes + `README.md` + height/icon size JSON.
- `taskbar/islands/` — islands-layout themes + `README.md` + height/icon size JSON.
- `taskbar/translucid/` — legacy transparent themes (`glassx.json`,
  `xtranslucid.json`).
- `taskbar/generate.py` — regenerates the `dock/` themes from the canonical
  palettes in `yasb/generate.py`; edit the template/accents and rerun
  `python taskbar/generate.py`.

## Notes

- The Start button is hidden in every theme.
- Requires the Hack Nerd Font (or any Nerd Font) for icon glyphs.
- For running app labels, combine with the **Taskbar Labels for Windows 11**
  mod.
