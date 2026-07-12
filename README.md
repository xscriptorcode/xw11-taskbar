<h1 align="center">macOS Xscriptor</h1>

<p align="center">
  Lightweight macOS desktop environment: SketchyBar topbar and AeroSpace window manager, configured for productivity and visual clarity.
</p>

<p align="center">
  <img alt="macOS" src="https://img.shields.io/badge/macOS-000000?logo=apple&logoColor=white" />
  <img alt="SketchyBar" src="https://img.shields.io/badge/SketchyBar-5ad4e6" />
  <img alt="AeroSpace" src="https://img.shields.io/badge/AeroSpace-948ae3" />
  <img alt="MIT" src="https://img.shields.io/badge/License-MIT-yellow" />
  <img alt="Bash" src="https://img.shields.io/badge/Bash-4EAA25?logo=gnubash&logoColor=white" />
</p>

<hr />

<h2 align="center">Contents</h2>
<ul>
  <li><a href="#about">About</a></li>
  <li><a href="#structure">Structure</a></li>
  <li><a href="#quick-install">Quick Install</a></li>
  <li><a href="#manual-install">Manual Install</a></li>
  <li><a href="#usage">Usage</a></li>
  <li><a href="#keybindings">Keybindings</a></li>
  <li><a href="#customization">Customization</a></li>
  <li><a href="#contributing">Contributing</a></li>
  <li><a href="#license">License</a></li>
  <li><a href="#related-repos">Related repos</a></li>
  <li><a href="#x">X</a></li>
</ul>

<h2 align="center" id="about">About</h2>

<p>
  Two tools, one setup:
</p>
<ul>
  <li><strong>SketchyBar</strong> — A customizable macOS topbar with workspace indicators, system stats, clock, volume, battery, and app launcher icons.</li>
  <li><strong>AeroSpace</strong> — A tiling window manager with virtual desktops (workspaces), keyboard-driven navigation, and automatic window placement rules.</li>
</ul>

<h2 align="center" id="structure">Structure</h2>
<ul>
  <li><code>sketchybar/</code> — SketchyBar config: bar styles, items, plugins, colors, and icons.</li>
  <li><code>aerospace/</code> — AeroSpace config: workspace bindings, gaps, window rules, and keybindings.</li>
  <li><code>install.sh</code> — Automated install script for dependencies and dotfiles.</li>
</ul>

<h2 align="center" id="quick-install">Quick Install</h2>

<pre>
git clone https://github.com/xscriptor/macosx.git ~/macosx-dotfiles
cd ~/macosx-dotfiles
chmod +x install.sh
./install.sh
</pre>

<h2 align="center" id="manual-install">Manual Install</h2>

<ol>
  <li>Install <a href="https://brew.sh">Homebrew</a> if not already installed.</li>
  <li>Run <code>brew install sketchybar aerospace</code>.</li>
  <li>Install Hack Nerd Font: <code>brew install --cask font-hack-nerd-font</code>.</li>
  <li>Copy <code>sketchybar/</code> to <code>~/.config/sketchybar/</code>.</li>
  <li>Copy <code>aerospace/aerospace.toml</code> to <code>~/.config/aerospace/aerospace.toml</code>.</li>
  <li>Start services: <code>brew services start sketchybar</code>.</li>
  <li>Reload AeroSpace: <code>aerospace reload-config</code>.</li>
</ol>

<h2 align="center" id="usage">Usage</h2>

<ul>
  <li><strong>Switch workspace:</strong> <code>Ctrl + number</code> (1-9).</li>
  <li><strong>Move window to workspace:</strong> <code>Ctrl + Shift + number</code>.</li>
  <li><strong>Focus window:</strong> <code>Ctrl + h/j/k/l</code> (left/down/up/right).</li>
  <li><strong>Move window:</strong> <code>Ctrl + Shift + h/j/k/l</code>.</li>
  <li><strong>Resize:</strong> <code>Ctrl + -</code> / <code>Ctrl + =</code>.</li>
  <li><strong>Fullscreen:</strong> <code>Ctrl + f</code>.</li>
  <li><strong>Close window:</strong> <code>Ctrl + w</code>.</li>
  <li><strong>Toggle floating:</strong> <code>Ctrl + t</code>.</li>
  <li><strong>Open apps:</strong> <code>Ctrl + Enter</code> (Kitty), <code>Ctrl + v</code> (VS Code), <code>Ctrl + b</code> (Brave).</li>
  <li><strong>Reload AeroSpace:</strong> <code>Ctrl + Shift + r</code>.</li>
  <li><strong>Click workspace number</strong> on the topbar to switch.</li>
</ul>

<h2 align="center" id="keybindings">Keybindings</h2>

<p>
  All bindings use <strong>Ctrl</strong> as the primary modifier to avoid conflicts with macOS Option-key characters (useful for Spanish and other non-US keyboard layouts).
</p>

<h2 align="center" id="customization">Customization</h2>

<ul>
  <li><strong>Colors:</strong> Edit <code>sketchybar/colors.sh</code> to change accent colors for the topbar.</li>
  <li><strong>Icons:</strong> Edit <code>sketchybar/icons.sh</code> to change icon glyphs (Nerd Font required).</li>
  <li><strong>Window rules:</strong> Edit <code>aerospace/aerospace.toml</code> under <code>on-window-detected</code> to add new app-to-workspace bindings.</li>
  <li><strong>Keybindings:</strong> Edit <code>[mode.main.binding]</code> in <code>aerospace/aerospace.toml</code>.</li>
</ul>

<h2 align="center" id="contributing">Contributing</h2>

<p>
  Contributions are welcome. Fork the repo, make your changes, and open a pull request.
</p>

<h2 align="center" id="license">License</h2>

<p>
  MIT License. See <a href="./LICENSE">LICENSE</a> for details.
</p>

<h2 align="center" id="related-repos">Related Repos</h2>
<ul>
  <li><a href="https://github.com/xscriptor/terminal">Terminal</a> <img src="https://xscriptor.github.io/icons/icons/code/product-design/xsvg/terminal-bash.svg" /></li>
  <li><a href="https://github.com/xscriptor/nvim">Nvim</a> <img src="https://xscriptor.github.io/icons/icons/code/product-design/xsvg/file-text.svg"/></li>
  <li><a href="https://github.com/xscriptor/vscode">VSCode</a> <img src="https://xscriptor.github.io/icons/icons/code/product-design/xsvg/project.svg"/></li>
  <li><a href="https://github.com/xscriptor/jetbrains">Jetbrains</a> <img src="https://xscriptor.github.io/icons/icons/code/product-design/xsvg/project.svg"/></li>
  <li><a href="https://github.com/xscriptor/gitnapse">Gitnapse</a> <img src="https://xscriptor.github.io/icons/icons/code/product-design/xsvg/github-alt.svg"/></li>
  <li><a href="https://github.com/xscriptor/obsidian">Obsidian</a> <img src="https://xscriptor.github.io/icons/icons/code/product-design/xsvg/markdown.svg"/></li>
  <li><a href="https://github.com/xscriptor/xfetch">XFetch</a> <img src="https://xscriptor.github.io/icons/icons/code/product-design/xsvg/git-fetch.svg"/></li>
  <li><a href="https://github.com/xscriptor/xcode">Xcode</a> <img src="https://xscriptor.github.io/icons/icons/code/product-design/xsvg/project.svg"/></li>
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
