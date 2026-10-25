# =================================================================================
# Somos TSS CO. - Instalación de Drivers Lenovo (Simulación)
# =================================================================================
# Historial de versiones:
# v1.3.5 - Prueba con listado completo de controladores simulados
# =================================================================================
# Version 1.3.5 - 07/10/2026

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$ScriptVersion = "1.3.5"
$ScriptDate = "07/10/2026"

$StartTime = Get-Date

# Alias visual, no cambia el hostname real
$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
$Last6 = $Serial.Substring($Serial.Length - 6)
$CustomHost = "BOG" + $Last6

$Title = "Somos TSS CO. - Instalación de Drivers Lenovo (Simulación)"
$LogPath = "C:\AIMT\Logs\Drivers_Update_Sim_$CustomHost.log"
$DriverPath = "C:\AIMT\Controladores\Lenovo"

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

# Cabecera en log
Show-Block "$Title`nVersion $ScriptVersion`nFecha Version $ScriptDate`nEquipo (alias): $CustomHost`nUsuario: $env:USERNAME`nInicio: $(Get-Date)" "Cyan"

# Simulación de instalación de controladores
Show-Block "Simulación de instalación de controladores desde $DriverPath (incluye subcarpetas)" "Green"

$Drivers = Get-ChildItem -Path $DriverPath -Recurse -Filter *.inf
$TotalDrivers = $Drivers.Count
$Index = 0
$DriverNames = @()

foreach ($Driver in $Drivers) {
    $Index++
    $DriverName = Split-Path $Driver.FullName -Leaf
    $DriverNames += $DriverName
    Write-Host "[SIMULACIÓN] >>> ($Index/$TotalDrivers) Instalando controlador: $DriverName..." -ForegroundColor Yellow
    "[SIMULACIÓN] Instalando controlador: $DriverName" | Out-File $LogPath -Append -Encoding ascii
    Write-Host "[SIMULACIÓN] Controlador $DriverName instalado correctamente." -ForegroundColor Green
    "[SIMULACIÓN] Controlador $DriverName instalado correctamente." | Out-File $LogPath -Append -Encoding ascii
}

# Finalización con resumen y listado
$EndTime = Get-Date
$Duration = $EndTime - $StartTime

Show-Block "FIN DEL PROCESO (SIMULACIÓN): $EndTime`nDuración total: $($Duration.Hours)h $($Duration.Minutes)m $($Duration.Seconds)s`nTotal controladores simulados: $TotalDrivers" "Cyan"

if ($TotalDrivers -gt 0) {
    Show-Block "Listado de controladores simulados:`n$($DriverNames -join "`n")" "Yellow"
}

Pause

