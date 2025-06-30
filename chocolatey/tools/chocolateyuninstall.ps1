$ErrorActionPreference = 'Stop'
$packageName = 'tgstattools'

# Uninstall via pip
Write-Host "Uninstalling tgstattools via pip..."
& pip uninstall -y tgstattools

Write-Host "TgStatTools has been uninstalled successfully!" 