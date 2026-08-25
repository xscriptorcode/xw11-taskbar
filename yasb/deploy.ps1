<#
    deploy.ps1 - assemble the YASB config directory from this theme pack.

    Copies config.yaml, the 12 theme stylesheets and the theme switcher into
    the YASB config directory (%USERPROFILE%\.config\yasb or $env:YASB_CONFIG_HOME),
    rewrites the switcher paths to the real config location and keeps your
    current active theme when it already belongs to the pack. Existing
    config.yaml / styles.css are backed up as *.bak.

    Usage:
        powershell -ExecutionPolicy Bypass -File deploy.ps1
#>

$ErrorActionPreference = "Stop"

$src = $PSScriptRoot
$configDir = if ($env:YASB_CONFIG_HOME) { $env:YASB_CONFIG_HOME } else { Join-Path $HOME ".config\yasb" }

Write-Host "==> YASB config dir: $configDir"
New-Item -ItemType Directory -Path $configDir -Force | Out-Null

# Backup the current active files
foreach ($file in @("config.yaml", "styles.css")) {
    $target = Join-Path $configDir $file
    if (Test-Path $target) {
        Copy-Item $target "$target.bak" -Force
        Write-Host "==> Backup: $file -> $file.bak"
    }
}

# Keep the active stylesheet when it already belongs to the pack, otherwise start with X
$active = Join-Path $configDir "styles.css"
$isPack = (Test-Path $active) -and (Select-String -Path $active -Pattern "palette tokens" -Quiet)
if ($isPack) {
    Write-Host "==> Active theme kept (already one of the pack)"
} else {
    Copy-Item (Join-Path $src "themes\styles.x.css") $active -Force
    Write-Host "==> Active theme: X"
}

# Theme collection + switcher script
Copy-Item (Join-Path $src "themes\styles.*.css") $configDir -Force
Copy-Item (Join-Path $src "theme-switcher.ps1") (Join-Path $configDir "theme-switcher.ps1") -Force

# config.yaml with the switcher paths pointed at the real config dir.
# MUST read as UTF-8: the default ANSI codepage mangles non-ASCII (·, °...).
$cfg = Get-Content (Join-Path $src "config.yaml") -Raw -Encoding UTF8
$cfg = $cfg.Replace('%USERPROFILE%\.config\yasb', $configDir)
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText((Join-Path $configDir "config.yaml"), $cfg, $utf8NoBom)

if ($configDir -match " ") {
    Write-Host "WARNING: the config dir contains spaces. The run_cmd path in config.yaml"
    Write-Host "cannot be quoted (YASB splits run_cmd on spaces), so the switcher label"
    Write-Host "may stay on the icon placeholder. The switcher clicks still work."
}

Write-Host ""
Write-Host "Done. Reload YASB with: yasbc reload"
