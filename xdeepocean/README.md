#  xdeepocean theme for Windows 11 Taskbar Styler

**Author**: [xscriptorcode](https://github.com/xscriptorcode)

![Demonstration](files/xdeepocean.png)

**Note**: This theme is intended for **dark mode**. Please enable Windows dark mode to ensure proper contrast of the deep ocean background and soft pink highlights.

---

#  Overview

`xdeepocean` is a modern and elegant taskbar theme inspired by deep ocean tones. Built using the Windhawk mod **Taskbar Styler**, it features a dark navy blue base (`#001f3f`) with soft pink accents (`#f2cdcd`), rounded corners, and smooth icon-label alignment for a premium aesthetic. The theme includes a subtle, system-accented indicator for active apps.

---

#  Manual Installation

You can manually import the styles like this:

- Open the **Windows 11 Taskbar Styler** mod in Windhawk.
- Go to the **Advanced** tab.
- Paste the following JSON content in the "Mod settings" section and click **Save**.

<details>
<summary>Click to expand JSON content</summary>

```json

{
    "theme": "xdeepocean",
    "controlStyles[0].target": "Taskbar.TaskListButton",
    "controlStyles[0].styles[0]": "CornerRadius=13",
    "resourceVariables[0].variableKey": "",
    "resourceVariables[0].value": "",
    "controlStyles[1].target": "SystemTray.TextIconContent > Grid#ContainerGrid > SystemTray.AdaptiveTextBlock#Base > TextBlock#InnerTextBlock",
    "controlStyles[1].styles[0]": "FontSize=16",
    "controlStyles[1].styles[1]": "Foreground=#f2cdcd",
    "controlStyles[2].target": "SystemTray.NotifyIconView#NotifyItemIcon",
    "controlStyles[2].styles[0]": "MinWidth=25",
    "controlStyles[3].target": "SystemTray.OmniButton#ControlCenterButton > Grid > ContentPresenter > ItemsPresenter > StackPanel > ContentPresenter[1] > SystemTray.IconView > Grid > Grid",
    "controlStyles[3].styles[0]": "Visibility=Collapsed",
    "controlStyles[4].target": "SystemTray.TextIconContent > Grid#ContainerGrid",
    "controlStyles[4].styles[0]": "Padding=2",
    "controlStyles[5].target": "SystemTray.ChevronIconView",
    "controlStyles[5].styles[0]": "MinWidth=27",
    "controlStyles[6].target": "SystemTray.OmniButton#NotificationCenterButton > Grid > ContentPresenter > ItemsPresenter > StackPanel > ContentPresenter > SystemTray.IconView#SystemTrayIcon > Grid > Grid > SystemTray.TextIconContent",
    "controlStyles[6].styles[0]": "Visibility=Collapsed",
    "controlStyles[7].target": "Taskbar.TaskListLabeledButtonPanel > Border#BackgroundElement",
    "controlStyles[7].styles[0]": "Background=#001f3f",
    "controlStyles[7].styles[1]": "CornerRadius=13",
    "controlStyles[8].target": "Grid#SystemTrayFrameGrid",
    "controlStyles[8].styles[0]": "Background=#001f3f",
    "controlStyles[8].styles[1]": "CornerRadius=13",
    "controlStyles[8].styles[2]": "Margin=0,5,4,5",
    "controlStyles[8].styles[3]": "Padding=2,0,-18,0",
    "controlStyles[9].target": "Taskbar.TaskListLabeledButtonPanel@CommonStates > Rectangle#RunningIndicator",
    "controlStyles[9].styles[0]": "Height=27",
    "controlStyles[9].styles[1]": "RadiusX=13",
    "controlStyles[9].styles[2]": "RadiusY=13",
    "controlStyles[9].styles[3]": "StrokeThickness=0",
    "controlStyles[9].styles[4]": "Stroke@InactivePointerOver=Transparent",
    "controlStyles[9].styles[5]": "Stroke@InactivePressed=Transparent",
    "controlStyles[9].styles[6]": "Stroke@ActiveNormal=Transparent",
    "controlStyles[9].styles[7]": "Stroke@ActivePointerOver=Transparent",
    "controlStyles[9].styles[8]": "Stroke@ActivePressed=Transparent",
    "controlStyles[9].styles[9]": "Fill=Transparent",
    "controlStyles[10].target": "SystemTray.ImageIconContent > Grid#ContainerGrid > Image",
    "controlStyles[10].styles[0]": "Width=13",
    "controlStyles[11].target": "SystemTray.TextIconContent > Grid#ContainerGrid > SystemTray.AdaptiveTextBlock#Base > TextBlock#InnerTextBlock",
    "controlStyles[11].styles[0]": "FontSize=13",
    "controlStyles[11].styles[1]": "Foreground=#f2cdcd",
    "controlStyles[12].target": "TextBlock#LabelControl",
    "controlStyles[12].styles[0]": "FontFamily=Segoe UI Medium",
    "controlStyles[12].styles[1]": "Foreground=#f2cdcd",
    "controlStyles[13].target": "Taskbar.ExperienceToggleButton#LaunchListButton[AutomationProperties.AutomationId=StartButton]",
    "controlStyles[13].styles[0]": "Visibility=Visible",
    "controlStyles[14].target": "Windows.UI.Xaml.Controls.TextBlock#InnerTextBlock[Text=]",
    "controlStyles[14].styles[0]": "Text=",
    "controlStyles[14].styles[1]": "Foreground=#f2cdcd",
    "controlStyles[15].target": "Rectangle#BackgroundFill",
    "controlStyles[15].styles[0]": "Fill=Transparent",
    "controlStyles[16].target": "Rectangle#BackgroundStroke",
    "controlStyles[16].styles[0]": "Fill=Transparent",
    "controlStyles[17].target": "TextBlock#LabelControl",
    "controlStyles[17].styles[0]": "Foreground=#f2cdcd",
    "controlStyles[18].target": "SystemTray.TextIconContent > Grid#ContainerGrid > SystemTray.AdaptiveTextBlock#Base > TextBlock#InnerTextBlock",
    "controlStyles[18].styles[0]": "Foreground=#f2cdcd"
}

```
</details>

##  Notes

- Deep ocean background color (`#001f3f`) for a calm visual tone.
- Soft pink highlights (`#f2cdcd`) for labels and icons.
- System accent color used for active app indicators; subtle navy gray when inactive.
- Rounded corners (`CornerRadius=13`) throughout for a smooth layout.
- Margin added to prevent icon-label overlap.

##  Suggested Windows Settings

- Use the default (centered) taskbar alignment.
- Use 100% display scale for sharp visuals.
- Combine with Windhawk mods for labels and clock customization if desired.
- Consider matching your wallpaper to deep ocean tones for full immersion.