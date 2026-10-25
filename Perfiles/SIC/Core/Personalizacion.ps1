# =================================================================================
# Somos TSS CO. | TESSA
# Tecnossystem Smart Setup Assistant
#
# Módulo : Personalizacion
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
# TESSA\Perfiles\SIC\Core\Personalizacion.ps1
# =================================================================================

$TessaRoot = (Resolve-Path "$PSScriptRoot\..\..\..").Path

$LogFolder = Join-Path $TessaRoot "Logs"

$WallpaperSource = Join-Path `
    $TessaRoot `
    "Perfiles\SIC\Wallpapers\thumb-imgpsh_fullsize_anim.png"

$WallpaperDest = "C:\Windows\Web\Screen\thumb-imgpsh_fullsize_anim.png"

if (!(Test-Path $LogFolder)) {
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogPath = Join-Path `
    $LogFolder `
    "Personalizacion_$CustomHost.log"

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

Módulo : Personalizacion
Versión: $ScriptVersion
Fecha   : $ScriptDate

Equipo  : $CustomHost
Usuario : $env:USERNAME

Inicio  : $(Get-Date)
"@ "Cyan"

try {

    Show-Block "Aplicando personalización corporativa..." "Green"

    Copy-Item `
        -Path $WallpaperSource `
        -Destination $WallpaperDest `
        -Force

    reg add `
        "HKU\.DEFAULT\Control Panel\Desktop" `
        /v Wallpaper `
        /t REG_SZ `
        /d $WallpaperDest `
        /f | Out-Null

    try {

        reg add `
            "HKU\.DEFAULT\Software\Microsoft\Input\Settings" `
            /v EnableHwkbTextPrediction `
            /t REG_DWORD `
            /d 1 `
            /f | Out-Null

        reg add `
            "HKU\.DEFAULT\Software\Microsoft\Input\Settings" `
            /v EnableHwkbTextPredictionMultilingual `
            /t REG_DWORD `
            /d 1 `
            /f | Out-Null

        Write-Host `
            "Sugerencias de texto habilitadas." `
            -ForegroundColor Green

    }
    catch {

        Write-Host `
            "No aplica: sugerencias multilingües." `
            -ForegroundColor Yellow

    }

    try {

        reg add `
            "HKU\.DEFAULT\Software\Microsoft\BatteryFlyout" `
            /v ShowPercentage `
            /t REG_DWORD `
            /d 1 `
            /f | Out-Null

        Write-Host `
            "Porcentaje de batería habilitado." `
            -ForegroundColor Green

    }
    catch {

        Write-Host `
            "No aplica: equipo sin batería." `
            -ForegroundColor Yellow

    }

    Get-ChildItem "C:\Users" | ForEach-Object {

        $UserFolder = $_.FullName
        $UserName   = $_.Name

        if ($UserName -notin @(
            "Default",
            "Public",
            "Administrador",
            "AdminSIC"
        )) {

            if (Test-Path "$UserFolder\NTUSER.DAT") {

                Write-Host `
                    "Aplicando configuración a $UserName" `
                    -ForegroundColor Green

                reg load HKU\TempHive `
                    "$UserFolder\NTUSER.DAT" | Out-Null

                reg add `
                    "HKU\TempHive\Control Panel\Desktop" `
                    /v Wallpaper `
                    /t REG_SZ `
                    /d $WallpaperDest `
                    /f | Out-Null

                try {

                    reg add `
                        "HKU\TempHive\Software\Microsoft\Input\Settings" `
                        /v EnableHwkbTextPrediction `
                        /t REG_DWORD `
                        /d 1 `
                        /f | Out-Null

                    reg add `
                        "HKU\TempHive\Software\Microsoft\Input\Settings" `
                        /v EnableHwkbTextPredictionMultilingual `
                        /t REG_DWORD `
                        /d 1 `
                        /f | Out-Null

                }
                catch {

                    Write-Host `
                        "No aplica para $UserName" `
                        -ForegroundColor Yellow

                }

                try {

                    reg add `
                        "HKU\TempHive\Software\Microsoft\BatteryFlyout" `
                        /v ShowPercentage `
                        /t REG_DWORD `
                        /d 1 `
                        /f | Out-Null

                }
                catch {

                    Write-Host `
                        "Sin batería para $UserName" `
                        -ForegroundColor Yellow

                }

                reg unload HKU\TempHive | Out-Null
            }
        }
    }

    "Personalización aplicada correctamente." |
        Out-File $LogPath -Append -Encoding utf8

    Write-Host `
        "Personalización aplicada correctamente." `
        -ForegroundColor Green

}
catch {

    "Error en personalización: $_" |
        Out-File $LogPath -Append -Encoding utf8

    Write-Host `
        "Error en personalización: $_" `
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
