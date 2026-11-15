# ExTYeredey / Exotic Tigers Controller
# Safely copy pre-existing SVG files from a recovered GPV2 asset directory.
# By default this script only previews actions (no copy/overwrite).
# Usage: .\scripts\recover-assets.ps1 -SourcePath 'C:\path\reference-v2'
#        .\scripts\recover-assets.ps1 -SourcePath 'C:\path\reference-v2' -Apply

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$SourcePath,
    [switch]$Apply
)

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$destination = Join-Path $repoRoot 'docs\reference-v2'

if (-not (Test-Path -LiteralPath $SourcePath -PathType Container)) {
    throw "Source folder does not exist: $SourcePath"
}
$source = (Resolve-Path -LiteralPath $SourcePath).Path.TrimEnd('\', '/')
$files = @(Get-ChildItem -LiteralPath $source -Recurse -File -Filter '*.svg')
if ($files.Count -eq 0) { throw "No SVG files were found in $source" }

Write-Host "SOURCE: $source"
Write-Host "TARGET: $destination"
Write-Host "FILES:  $($files.Count)"
Write-Host "MODE:   $(if ($Apply) {'COPY, NEVER OVERWRITE'} else {'DRY RUN'})"

foreach ($file in $files) {
    $relative = $file.FullName.Substring($source.Length).TrimStart('\', '/')
    $target = Join-Path $destination $relative
    if (Test-Path -LiteralPath $target) {
        Write-Host "SKIP existing: $relative"
        continue
    }
    if ($Apply) {
        $parent = Split-Path -Parent $target
        New-Item -ItemType Directory -Force -Path $parent | Out-Null
        Copy-Item -LiteralPath $file.FullName -Destination $target -ErrorAction Stop
        Write-Host "COPIED: $relative"
    } else {
        Write-Host "WOULD COPY: $relative"
    }
}
Write-Host ""
Write-Host "Review SVG contents before adding files to this PUBLIC repository."
Write-Host "Then run git status, stage docs/reference-v2, commit and push."
