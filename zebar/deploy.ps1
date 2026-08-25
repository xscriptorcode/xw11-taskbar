<#
    deploy.ps1 - deploy every pack in this folder to ~/.glzr/zebar.

    Each subfolder containing a zpack.json becomes a pack, installed under
    the same folder name. Existing packs are backed up as <name>.bak.

    Usage:
        powershell -ExecutionPolicy Bypass -File deploy.ps1
#>

$ErrorActionPreference = "Stop"

$src = $PSScriptRoot
$zebarDir = Join-Path (Join-Path $HOME ".glzr") "zebar"

New-Item -ItemType Directory -Path $zebarDir -Force | Out-Null

foreach ($packDir in Get-ChildItem $src -Directory) {
    $zpack = Join-Path $packDir.FullName "zpack.json"
    if (-not (Test-Path $zpack)) {
        continue
    }

    $dst = Join-Path $zebarDir $packDir.Name
    if (Test-Path $dst) {
        Copy-Item $dst "$dst.bak" -Recurse -Force
        Write-Host "==> Backup: $($packDir.Name) -> $($packDir.Name).bak"
        Remove-Item $dst -Recurse -Force
    }

    Copy-Item $packDir.FullName $dst -Recurse -Force
    Write-Host "==> Installed $($packDir.Name) -> $dst"
}

Write-Host ""
Write-Host "Done. Open the Zebar tray icon -> My widgets."
