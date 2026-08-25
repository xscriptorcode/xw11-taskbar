<#
    install.ps1 — remote bootstrap for the xscriptor-colors Windows setup.

    Downloads the latest snapshot of the repo from GitHub and runs the
    YASB + Zebar theme deploys (yasb\deploy.ps1, zebar\deploy.ps1), so any
    Windows 11 machine can install/update the themes from the remote
    without git or manual copying.

    Remote one-liner (PowerShell 5.1+):
        irm https://raw.githubusercontent.com/xscriptor-colors/windows/main/windows/install.ps1 | iex

    Or from a saved file:
        powershell -ExecutionPolicy Bypass -File install.ps1

    Options:
        -SkipApps   skip installing YASB/Zebar via winget when missing
        -Keep       keep the downloaded snapshot (default: cleanup)
#>
param(
    [switch]$SkipApps,
    [switch]$Keep
)

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$Repo    = "xscriptor-colors/windows"
$Branch  = "main"
$WorkDir = Join-Path $env:LOCALAPPDATA "Temp\xscriptor-colors-windows"

Write-Host "==> Fetching $Repo@$Branch"

New-Item -ItemType Directory -Path $WorkDir -Force | Out-Null
$Zip = Join-Path $WorkDir "windows.zip"
Invoke-WebRequest -Uri "https://codeload.github.com/$Repo/zip/refs/heads/$Branch" -OutFile $Zip

Remove-Item (Join-Path $WorkDir "src") -Recurse -Force -ErrorAction SilentlyContinue
Expand-Archive -Path $Zip -DestinationPath (Join-Path $WorkDir "src") -Force

# The archive contains a top folder named "<repo>-<branch>", and the repo
# content may live at its root or inside a subfolder (e.g. "windows/").
# Locate the folder that holds both deploy scripts.
$Root = Get-ChildItem (Join-Path $WorkDir "src") -Recurse -Directory | Where-Object {
    (Test-Path (Join-Path $_.FullName "yasb\deploy.ps1")) -and
    (Test-Path (Join-Path $_.FullName "zebar\deploy.ps1"))
} | Select-Object -First 1

if (-not $Root) {
    throw "Repo layout not found in the downloaded snapshot (missing yasb\deploy.ps1 / zebar\deploy.ps1)."
}
$Src = $Root.FullName

if (-not $SkipApps) {
    if (-not (Get-Command yasbc -ErrorAction SilentlyContinue)) {
        Write-Host "==> Installing YASB..."
        winget install --id AmN.yasb --accept-source-agreements --accept-package-agreements
    }
    winget list --id glzr-io.zebar --accept-source-agreements | Out-Null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "==> Installing Zebar..."
        winget install --id glzr-io.zebar --accept-source-agreements --accept-package-agreements
    }
}

Write-Host "==> Deploying YASB theme pack..."
& (Join-Path $Src "yasb\deploy.ps1")
Write-Host "==> Deploying Zebar packs..."
& (Join-Path $Src "zebar\deploy.ps1")

if (-not $Keep) {
    Remove-Item $WorkDir -Recurse -Force
}

Write-Host ""
Write-Host "Done."
Write-Host "  YASB:  run 'yasbc reload' (or restart YASB from the tray)"
Write-Host "  Zebar: tray icon -> My widgets -> xscriptor-colors-neumorphism / xneon"
