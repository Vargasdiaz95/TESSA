# =================================================================================
# Somos TSS CO. | TESSA
# Tecnossystem Smart Setup Assistant
#
# Módulo : Init
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
# TESSA\Perfiles\SIC\Core\Init.ps1
# =================================================================================

$TessaRoot = (Resolve-Path "$PSScriptRoot\..\..\..").Path

$AppsPath       = Join-Path $TessaRoot "Software\Aplicaciones"
$ComponentsPath = Join-Path $TessaRoot "Software\Componentes"
$LogFolder      = Join-Path $TessaRoot "Logs"

if (!(Test-Path $LogFolder)) {
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogPath = Join-Path `
    $LogFolder `
    "Init_$CustomHost.log"

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

function Install-App {

    param(
        [string]$FilePath,
        [string]$Arguments,
        [string]$Name
    )

    Write-Host "Instalando $Name..." -ForegroundColor Yellow

    "$Name" |
        Out-File $LogPath -Append -Encoding utf8

    "Comando: $FilePath $Arguments" |
        Out-File $LogPath -Append -Encoding utf8

    Start-Process `
        -FilePath $FilePath `
        -ArgumentList $Arguments `
        -Wait
}

# =================================================================================
# Cabecera
# =================================================================================

Show-Block @"
Somos TSS CO. | TESSA
Tecnossystem Smart Setup Assistant

Módulo : Init
Versión: $ScriptVersion
Fecha   : $ScriptDate

Equipo  : $CustomHost
Usuario : $env:USERNAME

Inicio  : $(Get-Date)
"@ "Cyan"

# =================================================================================
# FASE 1
# =================================================================================

Show-Block "FASE 1/4 - Aplicaciones Base" "Green"

Install-App `
    "msiexec.exe" `
    "/i `"$AppsPath\7z2603-x64.msi`" /passive /norestart" `
    "7-Zip"

Install-App `
    "$AppsPath\AcroRdrDCx642600221931_MUI.exe" `
    "/silent" `
    "Adobe Reader"

Install-App `
    "msiexec.exe" `
    "/i `"$AppsPath\googlechromestandaloneenterprise64.msi`" /passive /norestart" `
    "Google Chrome"

Write-Host "Instalando Java JRE..." -ForegroundColor Yellow

"Java JRE" |
    Out-File $LogPath -Append -Encoding utf8

Start-Process `
    -FilePath "$AppsPath\jre-8u503-windows-x64.exe" `
    -Wait

Install-App `
    "msiexec.exe" `
    "/i `"$AppsPath\LibreOffice_26.8.0_Win_x86-64.msi`" /passive /norestart" `
    "LibreOffice"

# =================================================================================
# FASE 2
# =================================================================================

Show-Block "FASE 2/4 - Aplicaciones Complementarias" "Green"

Install-App `
    "$AppsPath\JarvisBrowser-Setup.exe" `
    "/S" `
    "Jarvis Browser"

Write-Host "Instalando DeepL (modo asistido)..." `
    -ForegroundColor Yellow

"DeepL (modo asistido)" |
    Out-File $LogPath -Append -Encoding utf8

Start-Process `
    -FilePath "$AppsPath\DeepLSetup.exe" `
    -Wait

# =================================================================================
# FASE 3
# =================================================================================

Show-Block "FASE 3/4 - Soporte" "Green"

Install-App `
    "msiexec.exe" `
    "/i `"$AppsPath\tightvnc-2.8.88-gpl-setup-64bit.msi`" /passive /norestart" `
    "TightVNC"

Write-Host "Instalando Dell Command Update..." `
    -ForegroundColor Yellow

"Dell Command Update" |
    Out-File $LogPath -Append -Encoding utf8

Start-Process `
    -FilePath "$AppsPath\SupportAssistLauncher.exe" `
    -Wait

Write-Host "Instalando SupportAssist..." `
    -ForegroundColor Yellow

"SupportAssist" |
    Out-File $LogPath -Append -Encoding utf8

Start-Process `
    -FilePath "$AppsPath\system_update_5.08.04.85.exe" `
    -Wait

# =================================================================================
# FASE 4
# =================================================================================

Show-Block "FASE 4/4 - Configuración del Sistema" "Green"

Write-Host "Configurando .NET Framework 3.5..." `
    -ForegroundColor Yellow

Start-Process `
    -FilePath "DISM.exe" `
    -ArgumentList `
        "/Online",
        "/Enable-Feature",
        "/FeatureName:NetFx3",
        "/All "/LimitAccess",
        "/Source:$ComponentsPath\.NetFx3.5" `
    -Wait

# =================================================================================
# Configuración final
# =================================================================================

Write-Host "Cambiando nombre del equipo a $CustomHost..." `
    -ForegroundColor Yellow

"Nuevo nombre de equipo: $CustomHost" |
    Out-File $LogPath -Append -Encoding utf8

Rename-Computer `
    -NewName $CustomHost `
    -Force

Write-Host "Cambiando etiqueta de unidad C: a Windows..." `
    -ForegroundColor Yellow

"Nueva etiqueta de volumen C: Windows" |
    Out-File $LogPath -Append -Encoding utf8

label C: Windows

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