#!/usr/bin/env python3
"""Generate zebar/palettes.js from the canonical PALETTES (yasb/generate.py).

Derived colors follow the neumorphic design: dark palettes get a surface
lifted from the background toward the text; light palettes get a surface
slightly darker than the page.
"""

import importlib.util
import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
GEN = os.path.join(REPO, "yasb", "generate.py")
PACK = os.path.join(HERE, "neumorphism")  # the pack that consumes palettes.js

spec = importlib.util.spec_from_file_location("yasb_gen", GEN)
yasb = importlib.util.module_from_spec(spec)
spec.loader.exec_module(yasb)

ORDER = ["x", "madrid", "lahabana", "miami", "paris", "tokio", "oslo", "helsinki", "berlin", "london", "praha", "bogota"]

# X is the hand-tuned base theme (it is the template, not part of PALETTES).
X_VARS = {
    "--bg": "#050505",
    "--surface": "#17171e",
    "--surface-hi": "#1c1c24",
    "--surface-lo": "#121218",
    "--text": "#f7f1ff",
    "--text-dim": "#8b8598",
    "--text-faint": "#4e4a59",
    "--cyan": "#5ad4e6",
    "--mint": "#7bd88f",
    "--violet": "#948ae3",
    "--pink": "#fc618d",
    "--orange": "#fd9353",
}


def mix(c1, c2, t):
    return yasb.mix_hex(c1, c2, t)


def derive(p):
    bg, fg = p["background"], p["foreground"]
    dark = yasb.luminance(bg) < yasb.luminance(fg)
    if dark:
        surface = mix(bg, fg, 0.09)
        hi = mix(bg, fg, 0.12)
        lo = mix(bg, fg, 0.065)
        dim = mix(fg, bg, 0.45)
        faint = mix(fg, bg, 0.70)
    else:
        surface = mix(bg, "000000", 0.05)
        hi = mix(bg, "ffffff", 0.35)
        lo = mix(bg, "000000", 0.09)
        dim = mix(fg, "ffffff", 0.35)
        faint = mix(fg, "ffffff", 0.65)
    return {
        "--bg": bg,
        "--surface": surface,
        "--surface-hi": hi,
        "--surface-lo": lo,
        "--text": fg,
        "--text-dim": dim,
        "--text-faint": faint,
        "--cyan": p["color6"],
        "--mint": p["color2"],
        "--violet": p["color5"],
        "--pink": p["color1"],
        "--orange": p["color4"],
    }


def main():
    out = []
    for pid in ORDER:
        if pid == "x":
            out.append({"id": "x", "name": "X", "vars": X_VARS})
            continue
        p = yasb.PALETTES[pid]
        out.append({"id": pid, "name": p["name"], "vars": derive(p)})
    path = os.path.join(PACK, "palettes.js")
    with open(path, "w") as f:
        f.write("// Generated from yasb/generate.py PALETTES — do not edit by hand.\n")
        f.write("export const PALETTES = ")
        f.write(json.dumps(out, indent=2))
        f.write(";\n")
    print("wrote", path, f"({len(out)} palettes)")


if __name__ == "__main__":
    main()
