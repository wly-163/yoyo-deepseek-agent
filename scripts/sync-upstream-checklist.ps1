#Requires -Version 5.1
<#
.SYNOPSIS
  Print a checklist for syncing / verifying the upstream harness checkout.
#>
$ErrorActionPreference = 'Stop'

$Upstream = if ($env:YOYO_UPSTREAM) {
  $env:YOYO_UPSTREAM
} else {
  'D:\软件安装包\deepseek-harness'
}

Write-Host "Yoyo upstream checklist"
Write-Host "Checkout: $Upstream"
Write-Host ""

if (-not (Test-Path $Upstream)) {
  Write-Host "MISSING checkout. Clone https://github.com/deepseek-ai/deepseek-harness or set YOYO_UPSTREAM."
  exit 1
}

Push-Location $Upstream
try {
  Write-Host "== git remotes =="
  git remote -v
  Write-Host ""
  Write-Host "== status (short) =="
  git status -sb
  Write-Host ""
  Write-Host "Next steps:"
  Write-Host "  1. git fetch upstream   # or origin, if that tracks deepseek-ai"
  Write-Host "  2. git merge upstream/master"
  Write-Host "  3. pnpm install"
  Write-Host "  4. pnpm run build"
  Write-Host "  5. pnpm dsh --profile yoyo web"
} finally {
  Pop-Location
}
