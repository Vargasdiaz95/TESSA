# =================================================================================
# Somos TSS CO. | TESSA
# Tecnossystem Smart Setup Assistant
#
# Módulo : Drivers-Lenovo
# Versión: 2.0.0-alpha
# =================================================================================

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$ScriptVersion = "2.0.0-alpha"
$ScriptDate    = "24/10/2026"

$OldPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force

$StartTime = Get-Date

# =================================================================================
# Alias visual del equipo
# =================================================================================

$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
$Last6 = $Serial.Substring($Serial.Length - 6)
$CustomHost = "BOG$Last6"

# =================================================================================
# Resolución de rutas TESSA
# Ubicación del script:
# TESSA\Controladores\Core\Drivers-Lenovo.ps1
# =================================================================================

$TessaRoot = (Resolve-Path "$PSScriptRoot\..\..").Path

$LogFolder = Join-Path $TessaRoot "Logs"

$DriverPath = Join-Path `
    $TessaRoot `
    "Controladores\Lenovo"

$LogPath = Join-Path `
    $LogFolder `
    "Drivers-Lenovo_$CustomHost.log"

if (!(Test-Path $LogFolder)) {
    New-Item `
        -ItemType Directory `
        -Path $LogFolder `
        -Force | Out-Null
}

function Show-Block {

    param(
        [string]$Text,
        [string]$Color = "White"
    )

    Write-Host ("=" * 83) -ForegroundColor $Color
    