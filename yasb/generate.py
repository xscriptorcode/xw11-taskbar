#!/usr/bin/env python3
"""Regenerate the theme stylesheets in themes/ from the X base.

Usage: python generate.py

The template is themes/styles.x.css (the canonical X theme). Every other
stylesheet is derived from it by remapping the palette tokens with the
PALETTES below — the derived colors (islands, dim text, gradients, shadows,
rgba glows) are recomputed the same way the X theme was built.

To add a new theme: add its palette to PALETTES and rerun this script.
"""

import os

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATE = os.path.join(HERE, "themes", "styles.x.css")
OUT_DIR = os.path.join(HERE, "themes")

PALETTES = {
    "madrid": {
        "name": "Madrid",
        "color0": "#fafafa", "color1": "#990026", "color2": "#007a28",
        "color3": "#8a6408", "color4": "#007a9e", "color5": "#4d2699",
        "color6": "#007a9e", "color7": "#1a1a1a", "color8": "#4d4d4d",
        "color9": "#990026", "color10": "#007a28", "color11": "#8a6408",
        "color12": "#007a9e", "color13": "#4d2699", "color14": "#007a9e",
        "color15": "#1a1a1a", "background": "#fafafa", "foreground": "#1a1a1a",
    },
    "lahabana": {
        "name": "Lahabana",
        "color0": "#19191a", "color1": "#fc618d", "color2": "#7bd88f",
        "color3": "#e5ff9d", "color4": "#fd9353", "color5": "#948ae3",
        "color6": "#5ad4e6", "color7": "#f7f1ff", "color8": "#19191a",
        "color9": "#fc618d", "color10": "#7bd88f", "color11": "#e5ff9d",
        "color12": "#fd9353", "color13": "#948ae3", "color14": "#5ad4e6",
        "color15": "#f7f1ff", "background": "#19191a", "foreground": "#f7f1ff",
    },
    "miami": {
        "name": "Miami",
        "color0": "#000000", "color1": "#ff4c8b", "color2": "#7fffd4",
        "color3": "#ffd84c", "color4": "#00ffa8", "color5": "#d36cff",
        "color6": "#47cfff", "color7": "#f7f1ff", "color8": "#69676c",
        "color9": "#ff4c8b", "color10": "#7fffd4", "color11": "#ffd84c",
        "color12": "#00ffa8", "color13": "#d36cff", "color14": "#47cfff",
        "color15": "#f7f1ff", "background": "#000000", "foreground": "#f7f1ff",
    },
    "paris": {
        "name": "Paris",
        "color0": "#1a0a30", "color1": "#fc618d", "color2": "#7bd88f",
        "color3": "#fce566", "color4": "#a3f3ff", "color5": "#c4bdff",
        "color6": "#a3f3ff", "color7": "#1a0a30", "color8": "#c4bdff",
        "color9": "#fc618d", "color10": "#7bd88f", "color11": "#fce566",
        "color12": "#a3f3ff", "color13": "#c4bdff", "color14": "#a3f3ff",
        "color15": "#f7f1ff", "background": "#1a0a30", "foreground": "#f7f1ff",
    },
    "tokio": {
        "name": "Tokio",
        "color0": "#1c1c1d", "color1": "#fc618d", "color2": "#7bd88f",
        "color3": "#fce566", "color4": "#fd9353", "color5": "#948ae3",
        "color6": "#5ad4e6", "color7": "#f7f1ff", "color8": "#1c1c1d",
        "color9": "#fc618d", "color10": "#7bd88f", "color11": "#fce566",
        "color12": "#fd9353", "color13": "#948ae3", "color14": "#5ad4e6",
        "color15": "#f7f1ff", "background": "#1c1c1d", "foreground": "#f7f1ff",
    },
    "oslo": {
        "name": "Oslo",
        "color0": "#3f4451", "color1": "#e05561", "color2": "#8cc265",
        "color3": "#d18f52", "color4": "#4aa5f0", "color5": "#c162de",
        "color6": "#42b3c2", "color7": "#e6e6e6", "color8": "#4f5666",
        "color9": "#ff616e", "color10": "#a5e075", "color11": "#f0a45d",
        "color12": "#4dc4ff", "color13": "#de73ff", "color14": "#4cd1e0",
        "color15": "#ffffff", "background": "#3f4451", "foreground": "#abb2bf",
    },
    "helsinki": {
        "name": "Helsinki",
        "color0": "#f8fafe", "color1": "#1faa9e", "color2": "#733d9a",
        "color3": "#2e70ad", "color4": "#b55a0f", "color5": "#3e9d21",
        "color6": "#bd4c3d", "color7": "#544d40", "color8": "#b0a999",
        "color9": "#009e91", "color10": "#5a1f8a", "color11": "#0f5ba2",
        "color12": "#b23b00", "color13": "#218c00", "color14": "#b32e1f",
        "color15": "#000000", "background": "#f8fafe", "foreground": "#544d40",
    },
    "berlin": {
        "name": "Berlin",
        "color0": "#000000", "color1": "#999999", "color2": "#bbbbbb",
        "color3": "#dddddd", "color4": "#888888", "color5": "#aaaaaa",
        "color6": "#cccccc", "color7": "#ffffff", "color8": "#333333",
        "color9": "#bbbbbb", "color10": "#dddddd", "color11": "#ffffff",
        "color12": "#aaaaaa", "color13": "#cccccc", "color14": "#eeeeee",
        "color15": "#ffffff", "background": "#000000", "foreground": "#cccccc",
    },
    "london": {
        "name": "London",
        "color0": "#ffffff", "color1": "#333333", "color2": "#444444",
        "color3": "#555555", "color4": "#666666", "color5": "#777777",
        "color6": "#888888", "color7": "#333333", "color8": "#333333",
        "color9": "#444444", "color10": "#555555", "color11": "#666666",
        "color12": "#777777", "color13": "#888888", "color14": "#999999",
        "color15": "#aaaaaa", "background": "#ffffff", "foreground": "#333333",
    },
    "praha": {
        "name": "Praha",
        "color0": "#1a1a1a", "color1": "#ff5555", "color2": "#b8e6a0",
        "color3": "#ffe4a3", "color4": "#bd93f9", "color5": "#ff9aa2",
        "color6": "#8be9fd", "color7": "#ffffff", "color8": "#6272a4",
        "color9": "#ff6e6e", "color10": "#b8e6a0", "color11": "#ffe4a3",
        "color12": "#d6acff", "color13": "#ff9aa2", "color14": "#a4ffff",
        "color15": "#ffffff", "background": "#1a1a1a", "foreground": "#ffffff",
    },
    "bogota": {
        "name": "Bogota",
        "color0": "#200b0a", "color1": "#fc618d", "color2": "#7bd88f",
        "color3": "#ffed89", "color4": "#47e6ff", "color5": "#ff9999",
        "color6": "#47e6ff", "color7": "#f7f1ff", "color8": "#525053",
        "color9": "#fc618d", "color10": "#7bd88f", "color11": "#ffed89",
        "color12": "#47e6ff", "color13": "#ff9999", "color14": "#47e6ff",
        "color15": "#f7f1ff", "background": "#200b0a", "foreground": "#f7f1ff",
    },
}


def mix_hex(c1, c2, t):
    c1 = c1.lstrip("#")
    c2 = c2.lstrip("#")
    a = tuple(int(c1[i:i + 2], 16) for i in (0, 2, 4))
    b = tuple(int(c2[i:i + 2], 16) for i in (0, 2, 4))
    m = tuple(round(a[i] + (b[i] - a[i]) * t) for i in range(3))
    return "#{:02x}{:02x}{:02x}".format(*m)


def rgb(hexstr):
    hexstr = hexstr.lstrip("#")
    return tuple(int(hexstr[i:i + 2], 16) for i in (0, 2, 4))


def rgba(hexstr, a):
    r, g, b = rgb(hexstr)
    return "rgba({}, {}, {}, {})".format(r, g, b, a)


def luminance(hexstr):
    r, g, b = rgb(hexstr)
    return (r + g + b) / 3


def derive(p):
    bg = p["background"]
    fg = p["foreground"]
    cyan, pink, mint, yellow, orange, violet = (
        p["color6"], p["color1"], p["color2"], p["color3"], p["color4"], p["color5"],
    )
    dark = luminance(bg) < luminance(fg)
    if dark:
        island = mix_hex(bg, fg, 0.035)
        raised = mix_hex(bg, fg, 0.055)
        g1, g2, g3 = mix_hex(bg, fg, 0.12), mix_hex(bg, fg, 0.06), mix_hex(bg, fg, 0.025)
        h1, h2, h3 = mix_hex(bg, fg, 0.15), mix_hex(bg, fg, 0.08), mix_hex(bg, fg, 0.035)
        line = "rgba(255, 255, 255, 0.07)"
        shadow = "rgba(0, 0, 0, 0.65)"
        hover_bg = mix_hex(bg, fg, 0.075)
    else:
        island = mix_hex(bg, "ffffff", 0.15)
        raised = mix_hex(bg, "ffffff", 0.40)
        g1, g2, g3 = mix_hex(bg, "ffffff", 0.55), mix_hex(bg, "ffffff", 0.15), mix_hex(bg, "000000", 0.08)
        h1, h2, h3 = mix_hex(bg, "ffffff", 0.70), mix_hex(bg, "ffffff", 0.30), mix_hex(bg, "000000", 0.05)
        line = "rgba(0, 0, 0, 0.07)"
        shadow = "rgba(0, 0, 0, 0.16)"
        hover_bg = mix_hex(bg, "000000", 0.06)
    dim = mix_hex(fg, bg, 0.5)
    faint = mix_hex(fg, bg, 0.7)
    return dict(
        bg=bg, fg=fg, island=island, raised=raised, dim=dim, faint=faint,
        cyan=cyan, pink=pink, mint=mint, yellow=yellow, orange=orange,
        violet=violet, g1=g1, g2=g2, g3=g3, h1=h1, h2=h2, h3=h3,
        line=line, shadow=shadow, hover_bg=hover_bg,
    )


CSS_SUBS = [
    ("/* X palette tokens */", "/* {name} palette tokens */"),
    ("--bg: #050505;", "--bg: {bg};"),
    ("--island: #0d0d10;", "--island: {island};"),
    ("--island-raised: #111117;", "--island-raised: {raised};"),
    ("--island-line: rgba(255, 255, 255, 0.07);", "--island-line: {line};"),
    ("--text: #f7f1ff;", "--text: {fg};"),
    ("--text-dim: #7d778c;", "--text-dim: {dim};"),
    ("--text-faint: #4e4a59;", "--text-faint: {faint};"),
    ("--cyan: #5ad4e6;", "--cyan: {cyan};"),
    ("--pink: #fc618d;", "--pink: {pink};"),
    ("--mint: #7bd88f;", "--mint: {mint};"),
    ("--yellow: #fce566;", "--yellow: {yellow};"),
    ("--orange: #fd9353;", "--orange: {orange};"),
    ("--violet: #948ae3;", "--violet: {violet};"),
    ("linear-gradient(135deg, #22222c 0%, #14141a 50%, #0a0a0d 100%)",
     "linear-gradient(135deg, {g1} 0%, {g2} 50%, {g3} 100%)"),
    ("linear-gradient(135deg, #272733 0%, #18181f 50%, #0c0c10 100%)",
     "linear-gradient(135deg, {h1} 0%, {h2} 50%, {h3} 100%)"),
    ("box-shadow: 0 5px 14px rgba(0, 0, 0, 0.65);", "box-shadow: 0 5px 14px {shadow};"),
    ("border-color: rgba(90, 212, 230, 0.3);", "border-color: {rgba_cyan_03};"),
    ("background-color: rgba(90, 212, 230, 0.1);", "background-color: {rgba_cyan_01};"),
    ("text-shadow: 0 0 10px rgba(90, 212, 230, 0.4);", "text-shadow: 0 0 10px {rgba_cyan_04};"),
    ("text-shadow: 0 0 10px rgba(252, 97, 141, 0.45);", "text-shadow: 0 0 10px {rgba_pink_045};"),
    ("background-color: rgba(13, 13, 16, 0.94);", "background-color: {rgba_island_094};"),
    ("background-color: #16161c;", "background-color: {hover_bg};"),
    ("border: 1px solid rgba(90, 212, 230, 0.3);", "border: 1px solid {rgba_cyan_03};"),
    ("color: rgba(247, 241, 255, 0.9);", "color: {rgba_fg_09};"),
    ("color: rgba(247, 241, 255, 0.2);", "color: {rgba_fg_02};"),
    ("color: rgba(252, 97, 141, 0.45);", "color: {rgba_pink_045};"),
    ("color: rgba(252, 97, 141, 0.9);", "color: {rgba_pink_09};"),
    ("color: rgba(90, 212, 230, 0.5);", "color: {rgba_cyan_05};"),
    ("color: rgba(90, 212, 230, 0.95);", "color: {rgba_cyan_095};"),
]


def build_css(css, name, d):
    ctx = dict(d, name=name)
    ctx.update(
        rgba_cyan_01=rgba(d["cyan"], 0.1),
        rgba_cyan_03=rgba(d["cyan"], 0.3),
        rgba_cyan_04=rgba(d["cyan"], 0.4),
        rgba_cyan_05=rgba(d["cyan"], 0.5),
        rgba_cyan_095=rgba(d["cyan"], 0.95),
        rgba_pink_045=rgba(d["pink"], 0.45),
        rgba_pink_09=rgba(d["pink"], 0.9),
        rgba_fg_02=rgba(d["fg"], 0.2),
        rgba_fg_09=rgba(d["fg"], 0.9),
        rgba_island_094=rgba(d["island"], 0.94),
    )
    for old, new in CSS_SUBS:
        assert old in css, "Template literal not found: " + old
        css = css.replace(old, new.format(**ctx))
    return css


def main():
    with open(TEMPLATE) as f:
        css = f.read()
    for folder, p in PALETTES.items():
        d = derive(p)
        out = os.path.join(OUT_DIR, "styles.{}.css".format(folder))
        with open(out, "w") as f:
            f.write(build_css(css, p["name"], d))
        print("wrote", out)
    print("template kept:", TEMPLATE)


if __name__ == "__main__":
    main()
