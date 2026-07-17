
<h1 align="center">Desktop</h1>

> X dotfiles and system configurations for Linux, macOS, and Windows

<div align="center">

![Linux](https://img.shields.io/badge/Linux-Arch-FCC624?logo=linux&logoColor=black) ![macOS](https://img.shields.io/badge/macOS-Sequoia-000000?logo=apple&logoColor=white) ![Windows](https://img.shields.io/badge/Windows-11-0078D4?logo=windows&logoColor=white) ![PowerShell](https://img.shields.io/badge/PowerShell-7-5391FE?logo=powershell&logoColor=white) ![SketchyBar](https://img.shields.io/badge/SketchyBar-Topbar-5ad4e6) ![AeroSpace](https://img.shields.io/badge/AeroSpace-Tiling-948ae3) ![Windhawk](https://img.shields.io/badge/Windhawk-Taskbar-FF6F00) ![VS Code](https://img.shields.io/badge/VS_Code-Extensions-007ACC?logo=visualstudiocode&logoColor=white) ![MIT](https://img.shields.io/badge/License-MIT-yellow)

</div>

<h2 align="center">Tree</h2>

- **Linux**:
    - **[Linux](./linux/README.md)**: Minimal Arch-based environment with X Linux.

- **macOS**:
    - **[macOS](./macos/README.md)**: SketchyBar topbar configuration, AeroSpace tiling window manager, install and uninstall scripts.

- **Windows**:
    - **[Taskbar](./windows/taskbar/README.md)**: Themes for Windhawk taskbar customization.
    - **[PowerShell](./windows/powershell/README.md)**: Terminal customization and utilities.
    - **[VS Code & forks](./windows/vscode/README.md)**: Extensions and themes for Visual Studio Code and its forks.

<h2 align="center">Overview</h2>

This repository centralizes my personal desktop configuration across three operating systems. Each platform directory contains its own README with detailed setup instructions, customization guides, and relevant scripts.

| Platform | Tools | Status |
|----------|-------|--------|
| **Linux** | X Linux (Arch-based) | Ready |
| **macOS** | SketchyBar, AeroSpace | Ready |
| **Windows** | Windhawk, PowerShell, VS Code | Active |



<h2 align="center">Platforms</h2>

<h3>Linux</h3>

<p>
  Minimal Arch-based distribution spin optimized for development and terminal-centric workflows. Configured with X Linux dotfiles and utilities.
</p>

<ul>
  <li><strong>Distribution:</strong> <a href="https://www.github.com/xscriptor/x-linux">X Linux</a> &mdash; Arch-based, minimal, purpose-built for development.</li>
  <li><strong>Windows Manager:</strong> Tiling window manager setup with custom keybindings and workspaces.</li>
  <li><strong>Terminal:</strong> Custom terminal configuration with lightweight system tools: <a href="https://github.com/xscriptor/xfetch">Xfetch</a>, <a href="https://github.com/xscriptor/xtop">Xtop</a>, <a href="https://github.com/xscriptor/xclock">Xclock</a>, <a href="https://github.com/xscriptor/gitnapse">GitNapse</a>.</li>
</ul>

<h3>macOS</h3>

<p>
  Lightweight macOS desktop environment with two core tools:
</p>

<ul>
  <li><strong>SketchyBar</strong> &mdash; customizable topbar with workspace indicators, system stats, clock, volume, battery, and app launcher icons.</li>
  <li><strong>AeroSpace</strong> &mdash; tiling window manager with virtual desktops, keyboard-driven navigation, and automatic window placement rules.</li>
  <li><strong>Quick install:</strong> <code>curl -fsSL https://raw.githubusercontent.com/xscriptor/macosx/main/install.sh | bash</code></li>
</ul>

<h3>Windows</h3>

<p>
  Customization suite for Windows 11 focusing on accessibility and productivity:
</p>

<ul>
  <li><strong>Taskbar Themes:</strong> Custom themes for <a href="https://github.com/ramensoftware/windhawk">Windhawk</a> taskbar mod, including xblackgold, xdark, xdeepocean, xgold, xgrapepurple, xicegray, xtranslucid, and xtranslucid-light.</li>
  <li><strong>PowerShell:</strong> Terminal customization with Oh My Posh, PSReadLine, and custom prompt.</li>
  <li><strong>VS Code & forks:</strong> Custom themes (Xscriptor Themes, X Dark Colors) and extensions (XGlass for glassmorphism effect).</li>
  <li><strong>Terminal apps:</strong> <a href="https://github.com/xscriptor/xfetch">Xfetch</a>, <a href="https://github.com/xscriptor/xtop">Xtop</a>, <a href="https://github.com/xscriptor/xclock">Xclock</a>, <a href="https://github.com/xscriptor/gitnapse">GitNapse</a>.</li>
</ul>

<h2 align="center">Getting Started</h2>

<p>
  Each platform has its own setup instructions. Navigate to the relevant directory for detailed guides:
</p>

<ul>
  <li><a href="./linux/README.md">Linux setup</a></li>
  <li><a href="./macos/README.md">macOS setup</a></li>
  <li><a href="./windows/README.md">Windows setup</a></li>
</ul>

<h2 align="center">Terminal Apps</h2>

<table>
  <tr>
    <th>Tool</th>
    <th>Description</th>
    <th>Repository</th>
  </tr>
  <tr>
    <td><strong>Xfetch</strong></td>
    <td>Modern fastfetch written in Rust</td>
    <td><a href="https://github.com/xscriptor/xfetch">github.com/xscriptor/xfetch</a></td>
  </tr>
  <tr>
    <td><strong>Xtop</strong></td>
    <td>Minimalist system monitor and task manager</td>
    <td><a href="https://github.com/xscriptor/xtop">github.com/xscriptor/xtop</a></td>
  </tr>
  <tr>
    <td><strong>Xclock</strong></td>
    <td>Lightweight terminal-based clock with customizable time zones</td>
    <td><a href="https://github.com/xscriptor/xclock">github.com/xscriptor/xclock</a></td>
  </tr>
  <tr>
    <td><strong>GitNapse</strong></td>
    <td>Interactive TUI tool for Git repository exploration and management</td>
    <td><a href="https://github.com/xscriptor/gitnapse">github.com/xscriptor/gitnapse</a></td>
  </tr>
</table>

<h2 align="center">VS Code & Forks</h2>

<ul>
  <li><strong>Themes:</strong>
    <ul>
      <li><a href="https://github.com/xscriptor/vscode/tree/main/themes/xscriptor-themes">Xscriptor Themes</a> &mdash; daily use main themes.</li>
      <li><a href="https://github.com/xscriptor/vscode/tree/main/themes/x-dark-colors">X Dark Colors</a> &mdash; occasional themes.</li>
    </ul>
  </li>
  <li><strong>Extensions:</strong>
    <ul>
      <li><a href="https://github.com/xscriptor/vscode/tree/main/extensions/xglass">XGlass</a> &mdash; glassmorphism effect for VS Code.</li>
    </ul>
  </li>
</ul>

<h2 align="center">Related Repositories</h2>

<ul>
  <li><a href="https://github.com/xscriptor/terminal">Terminal</a> &mdash; terminal configurations and scripts.</li>
  <li><a href="https://github.com/xscriptor/nvim">Nvim</a> &mdash; Neovim configuration.</li>
  <li><a href="https://github.com/xscriptor/vscode">VSCode</a> &mdash; VS Code themes and extensions.</li>
  <li><a href="https://github.com/xscriptor/jetbrains">Jetbrains</a> &mdash; JetBrains IDE configuration.</li>
  <li><a href="https://github.com/xscriptor/gitnapse">GitNapse</a> &mdash; Git TUI tool.</li>
  <li><a href="https://github.com/xscriptor/obsidian">Obsidian</a> &mdash; Obsidian vault configuration.</li>
  <li><a href="https://github.com/xscriptor/xfetch">XFetch</a> &mdash; system fetch tool.</li>
  <li><a href="https://github.com/xscriptor/xcode">Xcode</a> &mdash; Xcode configuration.</li>
</ul>



<div id="x" align="center">
<h2>X</h2>

<a href="https://dev.xscriptor.com">
  <img src="https://xscriptor.github.io/icons/icons/code/product-design/xsvg/verified-filled.svg" width="24" alt="X Web" />
</a>
 & 
<a href="https://github.com/xscriptor">
  <img src="https://xscriptor.github.io/icons/icons/code/product-design/xsvg/github.svg" width="24" alt="X Github Profile" />
</a>
 & 
<a href="https://www.xscriptor.com">
  <img src="https://xscriptor.github.io/icons/icons/code/product-design/xsvg/quotes.svg" width="24" alt="Xscriptor web" />
</a>

</div>
