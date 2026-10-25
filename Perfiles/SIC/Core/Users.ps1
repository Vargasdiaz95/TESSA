# =================================================================================
# Somos TSS CO. | TESSA
# Tecnossystem Smart Setup Assistant
#
# Módulo : Users
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
# TESSA\Perfiles\SIC\Core\Users.ps1
# =================================================================================

$TessaRoot = (Resolve-Path "$PSScriptRoot\..\..\..").Path

$LogFolder = Join-Path $TessaRoot "Logs"

if (!(Test-Path $LogFolder)) {
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogPath = Join-Path `
    $LogFolder `
    "Users_$CustomHost.log"

function Show-Block {

    param(
        [string]$Text,
        [string]$Color = "White"
    )

    Write-Host ("=" * 83) -ForegroundColor $Color
    Write-Host $Text -ForegroundColor $Color
    Write-Host ("=" * 83) -ForegroundColor $Color

@"
===================================================================================
$Text
===================================================================================
"@ | Out-File $LogPath -Append -Encoding utf8

}

# =================================================================================
# Cabecera
# =================================================================================

Show-Block @"
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo : Users
Versión: $ScriptVersion
Fecha   : $ScriptDate

Equipo  : $CustomHost
Usuario : $env:USERNAME

Inicio  : $(Get-Date)
"@ "Cyan"

# =================================================================================
# Creación del usuario
# =================================================================================

try {

    Write-Host `
        "Creando usuario OperadorSIC..." `
        -ForegroundColor Yellow

    net user OperadorSIC Sic2026* /add

    net user OperadorSIC `
        /fullname:"Operador SIC"

    net user OperadorSIC `
        /expires:never

    net user OperadorSIC `
        /passwordchg:no

    Set-LocalUser `
        -Name OperadorSIC `
        -PasswordNeverExpires $true

    "Usuario OperadorSIC creado correctamente." |
        Out-File $LogPath -Append -Encoding utf8

    Write-Host `
        "Usuario OperadorSIC creado correctamente." `
        -ForegroundColor Green

    Write-Host `
        "La contraseña no expira y no puede modificarse." `
        -ForegroundColor Green
}
catch {

    "Error al crear el usuario: $_" |
        Out-File $LogPath -Append -Encoding utf8

    Write-Host `
        "Error al crear el usuario: $_" `
        -ForegroundColor Red
}

# =================================================================================
# Resumen Final
# =================================================================================

$EndTime = Get-Date
$Duration = $EndTime - $StartTime

Show-Block @"
FIN DEL PROCESO

Fecha Final : $EndTime

Duración:
$($Duration.Hours)h
$($Duration.Minutes)m
$($Duration.Seconds)s
"@ "Cyan"

Set-ExecutionPolicy `
    -Scope Process `
    -ExecutionPolicy $OldPolicy `
    -Force

Write-Host ""
Write-Host "Presione ENTER para salir..." `
    -ForegroundColor Cyan

Read-Host
