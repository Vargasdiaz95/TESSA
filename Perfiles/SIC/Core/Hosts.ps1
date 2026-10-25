# =================================================================================
# Somos TSS CO. | TESSA
# Tecnossystem Smart Setup Assistant
#
# Módulo : Hosts
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
# TESSA\Perfiles\SIC\Core\Hosts.ps1
# =================================================================================

$TessaRoot = (Resolve-Path "$PSScriptRoot\..\..\..").Path

$LogFolder = Join-Path $TessaRoot "Logs"

if (!(Test-Path $LogFolder)) {
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogPath = Join-Path `
    $LogFolder `
    "Hosts_$CustomHost.log"

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

Módulo : Hosts
Versión: $ScriptVersion
Fecha   : $ScriptDate

Equipo  : $CustomHost
Usuario : $env:USERNAME

Inicio  : $(Get-Date)
"@ "Cyan"

try {

    $HostsFile = "$env:windir\System32\drivers\etc\hosts"

    $Entries = @"

127.0.0.1 netflix.com
127.0.0.1 www.netflix.com
127.0.0.1 disneyplus.com
127.0.0.1 www.disneyplus.com
127.0.0.1 primevideo.com
127.0.0.1 www.primevideo.com
127.0.0.1 hbomax.com
127.0.0.1 www.hbomax.com
127.0.0.1 paramountplus.com
127.0.0.1 www.paramountplus.com
127.0.0.1 tv.apple.com
127.0.0.1 www.hulu.com
127.0.0.1 www.starplus.com
127.0.0.1 www.crunchyroll.com
127.0.0.1 youtube.com
127.0.0.1 www.youtube.com
127.0.0.1 youtu.be
127.0.0.1 web.whatsapp.com
127.0.0.1 api.whatsapp.com
127.0.0.1 chat.whatsapp.com
127.0.0.1 whatsapp.com

"@

    Show-Block "Actualizando archivo Hosts..." "Green"

    Add-Content `
        -Path $HostsFile `
        -Value $Entries

    ipconfig /flushdns | Out-Null

    "Hosts actualizado correctamente." |
        Out-File $LogPath -Append -Encoding utf8

    Write-Host `
        "Hosts actualizado correctamente." `
        -ForegroundColor Green
}
catch {

    "Error al actualizar Hosts: $_" |
        Out-File $LogPath -Append -Encoding utf8

    Write-Host `
        "Error al actualizar Hosts: $_" `
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