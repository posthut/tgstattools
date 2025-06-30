$ErrorActionPreference = 'Continue'
$packageName = 'tgstattools'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

try {
    # Install via pip
    $pythonCmd = Get-Command python -ErrorAction SilentlyContinue
    if (-not $pythonCmd) {
        throw "Python 3.9+ is required but not found in PATH"
    }

    # Check Python version
    $pythonVersion = & python --version 2>&1
    if ($pythonVersion -notmatch "Python 3\.[9-9]|Python 3\.1[0-9]") {
        throw "Python 3.9+ is required. Found: $pythonVersion"
    }

    # Install tgstattools
    Write-Host "Installing tgstattools via pip..."
    & pip install --no-cache-dir --upgrade tgstattools

    # Verify installation
    Write-Host "Verifying installation..."
    $version = & tgstattools --version
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to verify tgstattools installation"
    }

    Write-Host "TgStatTools has been installed successfully!"
    Write-Host "Version installed: $version"
    Write-Host "Run 'tgstattools --help' to get started."
} catch {
    Write-Error $_.Exception.Message
    throw
} 