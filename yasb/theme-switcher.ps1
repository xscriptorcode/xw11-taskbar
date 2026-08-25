<#
    theme-switcher.ps1 - cycle the xscriptor-colors YASB themes from the bar

    Actions:
        next  - switch to the next theme in the cycle
        prev  - switch to the previous theme
        name  - print the current theme name (used for the bar label)

    Layout expected in the YASB config directory (next to this script):
        styles.css            active stylesheet
        styles.<theme>.css    one stylesheet per theme
        theme.current.txt     last applied theme (created automatically)
#>

param(
    [ValidateSet("next", "prev", "name")]
    [string]$Action = "next"
)

$ErrorActionPreference = "Stop"

$dir = $PSScriptRoot
$themes = @("x", "madrid", "lahabana", "miami", "paris", "tokio", "oslo", "helsinki", "berlin", "london", "praha", "bogota")
$stateFile = Join-Path $dir "theme.current.txt"
$activeFile = Join-Path $dir "styles.css"

function Get-StoredTheme {
    if (Test-Path $stateFile) {
        return (Get-Content $stateFile -Raw).Trim()
    }
    return $null
}

function Get-ActiveTheme {
    # Detect the active theme from the banner comment in styles.css
    # ("/* Lahabana palette tokens */"), falling back to the state file.
    if (Test-Path $activeFile) {
        $banner = Get-Content $activeFile | Where-Object { $_ -match "palette tokens" } | Select-Object -First 1
        if ($banner -match "^\s*/\*\s*([A-Za-z0-9_-]+)\s+palette tokens\s*\*/") {
            $detected = $matches[1].ToLower()
            if ($themes -contains $detected) {
                return $detected
            }
        }
    }
    $stored = Get-StoredTheme
    if ($stored -and ($themes -contains $stored)) {
        return $stored
    }
    return $themes[0]
}

$current = Get-ActiveTheme

switch ($Action) {
    "name" {
        Write-Output $current
        break
    }
    default {
        $index = [Array]::IndexOf($themes, $current)
        if ($index -lt 0) { $index = 0 }
        if ($Action -eq "prev") {
            $index = ($index - 1 + $themes.Count) % $themes.Count
        } else {
            $index = ($index + 1) % $themes.Count
        }
        $next = $themes[$index]
        Copy-Item -Path (Join-Path $dir "styles.$next.css") -Destination $activeFile -Force
        Set-Content -Path $stateFile -Value $next -NoNewline
        Write-Output $next
    }
}
