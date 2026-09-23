#Requires -Version 5.1
<#
.SYNOPSIS
  Install the Yoyo dsh profile into $DSH_HOME/profiles/yoyo.
#>
$ErrorActionPreference = 'Stop'

$RepoRoot = Split-Path -Parent $PSScriptRoot
$Source = Join-Path $RepoRoot 'profiles\yoyo'
if (-not (Test-Path $Source)) {
  throw "Missing profile source: $Source"
}

$DshHome = if ($env:DSH_HOME) { $env:DSH_HOME } else { Join-Path $env:USERPROFILE '.dsh' }
$Dest = Join-Path $DshHome 'profiles\yoyo'
New-Item -ItemType Directory -Force -Path $Dest | Out-Null

Copy-Item -Force (Join-Path $Source 'package.json') (Join-Path $Dest 'package.json')
Copy-Item -Force (Join-Path $Source 'cordis.patch.yml') (Join-Path $Dest 'cordis.patch.yml')
Copy-Item -Force (Join-Path $Source 'pnpm-workspace.yaml') (Join-Path $Dest 'pnpm-workspace.yaml')

Write-Host "Installed Yoyo profile -> $Dest"
Write-Host "Run from a DeepSeek Harness checkout: pnpm dsh --profile yoyo web"
