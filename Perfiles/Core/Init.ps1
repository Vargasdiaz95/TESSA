# =================================================================================
# Somos TSS CO. - Init (Despliegue de Aplicaciones)
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
# v1.3.10 - Ajuste: DeepL no silencioso y corrección definitiva de Dell Command Update / SupportAssist
# =================================================================================

$ScriptVersion = "1.3.10"
$ScriptDate = "08/10/2026"

$OldPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force

$StartTime = Get-Date

# Alias visual y nombre real del equipo
$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
$Last6 = $Serial.Substring($Serial.Length - 6)
$CustomHost = "BOG" + $Last6

$Title = "Somos TSS CO. - Init (Despliegue de Aplicaciones)"
$LogPath = "C:\AIMT\Logs\Init_$CustomHost.log"

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

function Install-App {
    param([string]$FilePath,[string]$Arguments,[string]$Name)
    Write-Host ">>> Instalando $Name..." -ForegroundColor Yellow
    "$Name" | Out-File $LogPath -Append -Encoding ascii
    "Comando: $FilePath $Arguments" | Out-File $LogPath -Append -Encoding ascii
    Start-Process -FilePath $FilePath -ArgumentList $Arguments -Wait
}

Show-Block "$Title`nVersion $ScriptVersion`nFecha Version $ScriptDate`nEquipo: $CustomHost`nUsuario: $env:USERNAME`nInicio: $(Get-Date)" "Cyan"

# =================================================================================
# Fases de instalación
# =================================================================================
Show-Block "Fase 1/4" "Green"
Install-App "msiexec.exe" "/i C:\AIMT\Apps\7z2603-x64.msi /passive /norestart" "7-Zip"
Install-App "C:\AIMT\Apps\AcroRdrDCx642600221931_MUI.exe" "/silent" "Adobe Reader"
Install-App "msiexec.exe" "/i C:\AIMT\Apps\googlechromestandaloneenterprise64.msi /passive /norestart" "Google Chrome"

Write-Host ">>> Instalando Java JRE..." -ForegroundColor Yellow
"Java JRE" | Out-File $LogPath -Append -Encoding ascii
Start-Process -FilePath "C:\AIMT\Apps\jre-8u503-windows-x64.exe" -Wait

Install-App "msiexec.exe" "/i C:\AIMT\Apps\LibreOffice_26.8.0_Win_x86-64.msi /passive /norestart" "LibreOffice"

Show-Block "Fase 2/4" "Green"
Install-App "C:\AIMT\Apps\JarvisBrowser-Setup.exe" "/S" "Jarvis Browser"

Write-Host ">>> Instalando DeepL (modo asistido)..." -ForegroundColor Yellow
"DeepL (modo asistido)" | Out-File $LogPath -Append -Encoding ascii
Start-Process -FilePath "C:\AIMT\Apps\DeepLSetup.exe" -Wait

Show-Block "Fase 3/4" "Green"
Install-App "msiexec.exe" "/i C:\AIMT\Apps\tightvnc-2.8.88-gpl-setup-64bit.msi /passive /norestart" "Tight VNC"

Write-Host ">>> Instalando Dell Command Update..." -ForegroundColor Yellow
"Dell Command Update" | Out-File $LogPath -Append -Encoding ascii
Start-Process -FilePath "C:\AIMT\Apps\SupportAssistLauncher.exe" -Wait

Write-Host ">>> Instalando SupportAssist..." -ForegroundColor Yellow
"SupportAssist" | Out-File $LogPath -Append -Encoding ascii
Start-Process -FilePath "C:\AIMT\Apps\system_update_5.08.04.85.exe" -Wait

Show-Block "Fase 4/4" "Green"
Write-Host ">>> Configurando .NET Framework 3.5..." -ForegroundColor Yellow
Start-Process -FilePath "DISM.exe" -ArgumentList "/Online","/Enable-Feature","/FeatureName:NetFx3","/All","/LimitAccess","/Source:C:\AIMT\Componentes\.NetFx3.5" -Wait

# =================================================================================
# Cambio de nombre del equipo y etiqueta de disco
# =================================================================================
Write-Host ">>> Cambiando nombre del equipo a $CustomHost..." -ForegroundColor Yellow
"Nuevo nombre de equipo: $CustomHost" | Out-File $LogPath -Append -Encoding ascii
Rename-Computer -NewName $CustomHost -Force

Write-Host ">>> Cambiando etiqueta del volumen C: a 'Windows'..." -ForegroundColor Yellow
"Nueva etiqueta de volumen C: Windows" | Out-File $LogPath -Append -Encoding ascii
label C: Windows

# =================================================================================
# Finalización
# =================================================================================
$EndTime = Get-Date
$Duration = $EndTime - $StartTime
Show-Block "FIN DEL PROCESO: $EndTime`nDuración total: $($Duration.Hours)h $($Duration.Minutes)m $($Duration.Seconds)s" "Cyan"

Set-ExecutionPolicy -Scope Process -ExecutionPolicy $OldPolicy -Force
Write-Host "Presione ENTER para salir..." -ForegroundColor Cyan
Read-Host