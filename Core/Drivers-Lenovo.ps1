# =================================================================================
# Somos TSS CO. - Instalación de Controladores Lenovo
# =================================================================================
# Historial de versiones:
# v1.0.0 - Script original en .bat
# v1.1.0 - Conversión a PowerShell con cabecera y log
# v1.2.0 - Función Show-Block, alias visual de equipo
# v1.3.0 - Instalación de controladores con nombre y progreso
# v1.3.1 - Cabecera uniforme en consola y log
# v1.3.2 - Versión de prueba (simulación, sin cambios reales)
# v1.3.3 - Producción con resumen final
# v1.3.4 - Producción con listado completo de controladores instalados
# v1.3.5 - Prueba con listado completo de controladores simulados
# =================================================================================
# Version 1.3.4 - 26/09/2026

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$ScriptVersion = "1.3.4"
$ScriptDate = "26/09/2026"

$OldPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force

$StartTime = Get-Date

# Alias visual, no cambia el hostname real
$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
$Last6 = $Serial.Substring($Serial.Length - 6)
$CustomHost = "BOG" + $Last6

$Title = "Somos TSS CO. - Instalación de Controladores Lenovo"
$LogPath = "C:\AIMT\Logs\Drivers_Update_$CustomHost.log"
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

function Install-Driver {
    param([string]$InfFile,[int]$Index,[int]$Total)
    $DriverName = Split-Path $InfFile -Leaf
    Write-Host ">>> ($Index/$Total) Instalando controlador: $DriverName..." -ForegroundColor Yellow
    "Instalando controlador: $DriverName" | Out-File $LogPath -Append -Encoding ascii

    try {
        Start-Process -FilePath "pnputil.exe" -ArgumentList "/add-driver `"$InfFile`" /install" -Wait -NoNewWindow -RedirectStandardOutput $LogPath -RedirectStandardError $LogPath
        Write-Host "Controlador $DriverName instalado correctamente." -ForegroundColor Green
        "Controlador $DriverName instalado correctamente." | Out-File $LogPath -Append -Encoding ascii
    } catch {
        Write-Host "Error al instalar $DriverName: $_" -ForegroundColor Red
        "Error al instalar $DriverName: $_" | Out-File $LogPath -Append -Encoding ascii
    }
}

# Cabecera en log
Show-Block "$Title`nVersion $ScriptVersion`nFecha Version $ScriptDate`nEquipo (alias): $CustomHost`nUsuario: $env:USERNAME`nInicio: $(Get-Date)" "Cyan"

# Instalación de controladores
Show-Block "Instalación de controladores desde $DriverPath (incluye subcarpetas)" "Green"

$Drivers = Get-ChildItem -Path $DriverPath -Recurse -Filter *.inf
$TotalDrivers = $Drivers.Count
$Index = 0
$DriverNames = @()

foreach ($Driver in $Drivers) {
    $Index++
    $DriverNames += (Split-Path $Driver.FullName -Leaf)
    Install-Driver $Driver.FullName $Index $TotalDrivers
}

# Finalización con resumen y listado
$EndTime = Get-Date
$Duration = $EndTime - $StartTime

Show-Block "FIN DEL PROCESO: $EndTime`nDuración total: $($Duration.Hours)h $($Duration.Minutes)m $($Duration.Seconds)s`nTotal controladores instalados: $TotalDrivers" "Cyan"

if ($TotalDrivers -gt 0) {
    Show-Block "Listado de controladores instalados:`n$($DriverNames -join "`n")" "Yellow"
}

Set-ExecutionPolicy -Scope Process -ExecutionPolicy $OldPolicy -Force
