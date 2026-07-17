# ✦ xicegray theme for Windows 11 Taskbar Styler

**Author**: [xscriptorcode](https://github.com/xscriptorcode)

![Demonstration](files/xicegray.png)

**Note**: This theme is ideal for light or neutral desktop environments. It features a frosty aqua tone with minimalist black text and soft, rounded elements.

---

# ✦ Overview

`xicegray` is a sleek, icy-themed taskbar style for Windows 11. It wraps each app icon in a light aqua background (`#A3E4D7`) with gentle hover highlights and a subtle dock-like structure. The taskbar background remains transparent to give the impression of floating app tiles.

This theme includes matching styles for the system tray, ensuring a consistent and polished appearance across your desktop.

---

# ✦ Manual Installation

You can manually import the styles like this:

- Open the **Windows 11 Taskbar Styler** mod in Windhawk.
- Go to the **Advanced** tab.
- Paste the JSON content of this theme in the "Mod settings" section and click **Save**.

<details>
<summary>Click to expand JSON content</summary>

```json

{
  "theme": "xicegray",
  "controlStyles[0].target": "Taskbar.TaskListButton",
  "controlStyles[0].styles[0]": "CornerRadius=6",
  "controlStyles[0].styles[1]": "Background=#A3E4D7",
  "controlStyles[0].styles[2]": "HoverBackground=#E4B400",
  "controlStyles[1].target": "Taskbar.TaskListLabeledButtonPanel > Border#BackgroundElement",
  "controlStyles[1].styles[0]": "Background=#A3E4D7",
  "controlStyles[1].styles[1]": "CornerRadius=6",
  "controlStyles[2].target": "Taskbar.TaskListButtonPanel#ExperienceToggleButtonRootPanel > Border#BackgroundElement",
  "controlStyles[2].styles[0]": "Background=#A3E4D7",
  "controlStyles[3].target": "Taskbar.TaskListButton > Grid > Rectangle#RunningIndicator",
  "controlStyles[3].styles[0]": "Height=3",
  "controlStyles[3].styles[1]": "RadiusX=1.5",
  "controlStyles[3].styles[2]": "RadiusY=1.5",
  "controlStyles[3].styles[3]": "Fill@ActiveNormal=#A3E4D7",
  "controlStyles[3].styles[4]": "Fill@InactiveNormal=#D4AF37",
  "controlStyles[3].styles[5]": "VerticalAlignment=Bottom",
  "controlStyles[3].styles[6]": "Margin=16,0,16,4",
  "controlStyles[3].styles[7]": "StrokeThickness=0",
  "controlStyles[4].target": "Rectangle#BackgroundFill",
  "controlStyles[4].styles[0]": "Fill=Transparent",
  "controlStyles[5].target": "Rectangle#BackgroundStroke",
  "controlStyles[5].styles[0]": "Fill=Transparent",
  "controlStyles[6].target": "Taskbar.TaskbarBackground",
  "controlStyles[6].styles[0]": "Background=Transparent",
  "controlStyles[7].target": "Taskbar.TaskbarFrame",
  "controlStyles[7].styles[0]": "Background=Transparent",
  "controlStyles[8].target": "Taskbar.BaseBackgroundElement",
  "controlStyles[8].styles[0]": "Background=Transparent",
  "controlStyles[9].target": "Taskbar.TaskbarBackgroundElement",
  "controlStyles[9].styles[0]": "Background=Transparent",
  "controlStyles[10].target": "TextBlock#LabelControl",
  "controlStyles[10].styles[0]": "FontFamily=JetBrainsMono NF",
  "controlStyles[10].styles[1]": "Foreground=#000000",
  "controlStyles[10].styles[2]": "Margin=1,0,0,0",
  "controlStyles[11].target": "Grid#SystemTrayFrameGrid",
  "controlStyles[11].styles[0]": "Background=#A3E4D7",
  "controlStyles[11].styles[1]": "CornerRadius=6",
  "controlStyles[11].styles[2]": "Padding=4,0,4,0",
  "controlStyles[11].styles[3]": "Margin=0,5,4,5"
}


```
</details>

---

## ✦ Notes

- Aqua tile background (`#A3E4D7`) for app icons and tray items.
- Black text (`#000000`) for strong contrast and readability.
- Rounded corners (`CornerRadius=6`) on buttons and containers.
- Transparent taskbar to simulate a modern, floating dock.
- Golden accent for inactive indicators (`#D4AF37`) and clean, minimal icon-to-text spacing.

---

## ✦ Suggested Windows Settings

- Use the default (centered) taskbar alignment.
- Recommended with **light mode** or neutral wallpapers.
- Display scaling at 100% for visual precision.
- Optionally, hide unused system tray icons for a cleaner look.
- Works well with frosted, glass-like desktop themes or minimal setups.
