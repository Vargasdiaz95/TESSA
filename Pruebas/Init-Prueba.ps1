# =================================================================================
# Somos TSS CO. - Init (Simulación de Despliegue)
# =================================================================================
# Historial de versiones:
# v1.0.0 - Script original .bat
# v1.1.0 - Conversión inicial a PowerShell
# v1.2.0 - Función Show-Block, ASCII, hostname personalizado
# v1.2.1 - Rutinas externas registradas solo como llamadas (seguridad)
# v1.3.0 - Rutinas externas de producción ejecutadas
# v1.3.3 - Ajustes: cambio de nombre del equipo, corrección de instaladores, sin rutinas externas, Pause final
# v1.3.4 - Actualización de instaladores (7-Zip 2603, Adobe Reader 221931), sin instalación silenciosa en SupportAssist y system_update
# v1.3.5 - Ajuste: Java ahora usa /silent como Adobe
# v1.3.6 - Invocación directa (&) para Java, SupportAssist y System_Update
# v1.3.7 - Uso de Start-Process -Wait sin argumentos para Java, SupportAssist y System_Update (espera correcta), pausa final corregida
# v1.3.8 - Cambio de etiqueta del volumen C: a "Windows"
# v1.3.9 - Corrección: mensajes y log alineados con ejecutables (SupportAssist vs Dell Command Update)
# v1.3.9-Prueba - Simulación: no ejecuta instaladores ni cambios reales, solo mensajes y log
# =================================================================================

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$ScriptVersion = "1.3.9-Prueba"
$ScriptDate = "07/10/2026"

$StartTime = Get-Date

# Alias visual
$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
$Last6 = $Serial.Substring($Serial.Length - 6)
$CustomHost = "BOG" + $Last6

$Title = "Somos TSS CO. - Init (Simulación)"
$LogPath = "C:\AIMT\Logs\Init_Sim_$CustomHost.log"

if (!(Test-Path "C:\AIMT\Logs")) {
    New-Item -ItemType Directory -Path "C:\AIMT\Logs" | Out-Null
}

function Show-Block {
    param([string]$Text,[string]$Color="White")
    Write-Host "===================================================================================" -ForegroundColor $Color
    Write-Host $Text -ForegroundColor $Color
    Write-Host "===================================================================================" -ForegroundColor $Color
    @"
===================================================================================
$Text
===================================================================================
"@ | Out-File $LogPath -Append -Encoding ascii
}

function Simulate-App {
    param([string]$AppName,[string]$File)
    Write-Host "[SIMULACIÓN] >>> Instalando $AppName desde $File..." -ForegroundColor Yellow
    "[SIMULACIÓN] Instalando $AppName desde $File" | Out-File $LogPath -Append -Encoding ascii
    Write-Host "[SIMULACIÓN] $AppName instalado correctamente." -ForegroundColor Green
    "[SIMULACIÓN] $AppName instalado correctamente." | Out-File $LogPath -Append -Encoding ascii
}

Show-Block "$Title`nVersion $ScriptVersion`nFecha Version $ScriptDate`nEquipo: $CustomHost`nUsuario: $env:USERNAME`nInicio: $(Get-Date)" "Cyan"

# =================================================================================
# Fases de instalación (Simulación)
# =================================================================================
Show-Block "Fase 1/4" "Green"
Simulate-App "7-Zip" "C:\AIMT\Apps\7z2603-x64.msi"
Simulate-App "Adobe Reader" "C:\AIMT\Apps\AcroRdrDCx642600221931_MUI.exe"
Simulate-App "Google Chrome" "C:\AIMT\Apps\googlechromestandaloneenterprise64.msi"
Simulate-App "Java JRE" "C:\AIMT\Apps\jre-8u503-windows-x64.exe"
Simulate-App "LibreOffice" "C:\AIMT\Apps\LibreOffice_26.8.0_Win_x86-64.msi"

Show-Block "Fase 2/4" "Green"
Simulate-App "Jarvis Browser" "C:\AIMT\Apps\JarvisBrowser-Setup.exe"
Simulate-App "DeepL" "C:\AIMT\Apps\DeepLSetup.exe"

Show-Block "Fase 3/4" "Green"
Simulate-App "Tight VNC" "C:\AIMT\Apps\tightvnc-2.8.88-gpl-setup-64bit.msi"
Simulate-App "Dell Command Update" "C:\AIMT\Apps\system_update_5.08.04.85.exe"
Simulate-App "SupportAssist" "C:\AIMT\Apps\SupportAssistLauncher.exe"

Show-Block "Fase 4/4" "Green"
Write-Host "[SIMULACIÓN] >>> Configurando .NET Framework 3.5..." -ForegroundColor Yellow
"[SIMULACIÓN] Configuración de .NET Framework 3.5" | Out-File $LogPath -Append -Encoding ascii

# =================================================================================
# Cambio de nombre del equipo y etiqueta de disco (Simulación)
# =================================================================================
Write-Host "[SIMULACIÓN] >>> Cambiando nombre del equipo a $CustomHost..." -ForegroundColor Yellow
"[SIMULACIÓN] Nuevo nombre de equipo: $CustomHost" | Out-File $LogPath -Append -Encoding ascii

Write-Host "[SIMULACIÓN] >>> Cambiando etiqueta del volumen C: a 'Windows'..." -ForegroundColor Yellow
"[SIMULACIÓN] Nueva etiqueta de volumen C: Windows" | Out-File $LogPath -Append -Encoding ascii

# =================================================================================
# Finalización
# =================================================================================
$EndTime = Get-Date
$Duration = $EndTime - $StartTime
Show-Block "[SIMULACIÓN] FIN DEL PROCESO: $EndTime`nDuración total: $($Duration.Hours)h $($Duration.Minutes)m $($Duration.Seconds)s" "Cyan"

Write-Host "Presione ENTER para salir..." -ForegroundColor Cyan
Read-Host