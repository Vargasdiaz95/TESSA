# =================================================================================
# Somos TSS CO. | TESSA
# Tecnossystem Smart Setup Assistant
#
# Módulo: TessaBanner
# Versión: 1.0.0
# =================================================================================

Set-StrictMode -Version Latest

function Show-TessaLine {
    param(
        [string]$Color = "White"
    )

    Write-Host ("=" * 83) -ForegroundColor $Color
}

function Show-TessaBanner {

    param(
        [Parameter(Mandatory)]
        [string]$Module,

        [string]$Version = "N/D",

        [string]$Profile = "SIC"
    )

    try {

        $Serial = (Get-CimInstance Win32_BIOS).SerialNumber

        $Alias = if ($Serial.Length -ge 6) {
            "BOG" + $Serial.Substring($Serial.Length - 6)
        }
        else {
            $env:COMPUTERNAME
        }

    }
    catch {

        $Alias = $env:COMPUTERNAME

    }

    Show-TessaLine -Color Cyan

    Write-Host "Somos TSS CO. | TESSA" -ForegroundColor Cyan
    Write-Host "Tecnossystem Smart Setup Assistant" -ForegroundColor Cyan
    Write-Host ""

    Write-Host "Módulo : $Module" -ForegroundColor White
    Write-Host "Versión: $Version" -ForegroundColor White
    Write-Host "Perfil : $Profile" -ForegroundColor White
    Write-Host "Equipo : $Alias" -ForegroundColor White
    Write-Host "Usuario: $env:USERNAME" -ForegroundColor White
    Write-Host "Fecha  : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor White

    Show-TessaLine -Color Cyan
}

function Show-TessaSection {

    param(
        [Parameter(Mandatory)]
        [string]$Title,

        [string]$Color = "Green"
    )

    Show-TessaLine -Color $Color

    Write-Host $Title -ForegroundColor $Color

    Show-TessaLine -Color $Color
}

function Show-TessaMessage {

    param(
        [Parameter(Mandatory)]
        [string]$Message,

        [string]$Type = "Info"
    )

    switch ($Type.ToUpper()) {

        "INFO" {
            Write-Host "[INFO]  $Message" -ForegroundColor Cyan
        }

        "OK" {
            Write-Host "[ OK ]  $Message" -ForegroundColor Green
        }

        "WARN" {
            Write-Host "[WARN]  $Message" -ForegroundColor Yellow
        }

        "ERROR" {
            Write-Host "[ERROR] $Message" -ForegroundColor Red
        }

        default {
            Write-Host $Message
        }
    }
}