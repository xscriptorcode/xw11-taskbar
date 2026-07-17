# xgold-dock theme for Windows 11 Taskbar Styler

**Author**: [xscriptorcode](https://github.com/xscriptorcode)

![Demonstration](files/xgold-dock.png)

**Note**: This theme is intended for a dock-like appearance. It highlights each app icon with a bold golden background while keeping the taskbar itself transparent.

---

# Overview

`xgold-dock` transforms your Windows 11 taskbar into a luxurious golden dock. Each app icon sits within a bold golden pill-shaped button, giving the illusion of floating tiles on your desktop. The taskbar background remains transparent to enhance this effect, and even the system tray adopts the same golden style for visual consistency.

Ideal for users seeking a bold, premium look with strong visual separation between app icons and the desktop background.

---

# Manual Installation

You can manually import the styles like this:

- Open the **Windows 11 Taskbar Styler** mod in Windhawk.
- Go to the **Advanced** tab.
- Paste the JSON content of this theme in the "Mod settings" section and click **Save**.

<details>
<summary>Click to expand JSON content</summary>

```json
{
  "theme": "xgold",
  "controlStyles[0].target": "Taskbar.TaskListButton",
  "controlStyles[0].styles[0]": "CornerRadius=6",
  "controlStyles[0].styles[1]": "Background=#FFD700",
  "controlStyles[0].styles[2]": "HoverBackground=#E4B400",
  "controlStyles[1].target": "Taskbar.TaskListLabeledButtonPanel > Border#BackgroundElement",
  "controlStyles[1].styles[0]": "Background=#FFD700",
  "controlStyles[1].styles[1]": "CornerRadius=6",
  "controlStyles[2].target": "Taskbar.TaskListButtonPanel#ExperienceToggleButtonRootPanel > Border#BackgroundElement",
  "controlStyles[2].styles[0]": "Background=#FFD700",
  "controlStyles[3].target": "Taskbar.TaskListButton > Grid > Rectangle#RunningIndicator",
  "controlStyles[3].styles[0]": "Height=3",
  "controlStyles[3].styles[1]": "RadiusX=1.5",
  "controlStyles[3].styles[2]": "RadiusY=1.5",
  "controlStyles[3].styles[3]": "Fill@ActiveNormal=#FFD700",
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
  "controlStyles[11].styles[0]": "Background=#FFD700",
  "controlStyles[11].styles[1]": "CornerRadius=6",
  "controlStyles[11].styles[2]": "Padding=4,0,4,0",
  "controlStyles[11].styles[3]": "Margin=0,5,4,5"
}

```
</details>

---

## Notes

- Individual app buttons are highlighted with bold golden color (`#FFD700`).
- The taskbar background is completely transparent to create a floating dock illusion.
- Running indicators also follow the golden color scheme.
- System tray (WiFi, sound, notifications) is styled to match.
- Text labels are subtly separated from icons using left margin.

---

## Suggested Windows Settings

- Use the default (centered) taskbar alignment.
- Set taskbar to dark mode for contrast, but this theme overrides background anyway.
- Use 100% display scaling for best clarity.
- Combine with a wallpaper that enhances golden and black tones.
