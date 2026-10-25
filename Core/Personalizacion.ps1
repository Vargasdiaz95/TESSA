# =================================================================================
# Somos TSS CO. - Rutina de Personalización de Entorno
# =================================================================================
# Historial de versiones:
# v1.0.0 - Script original en .bat
# v1.1.0 - Conversión a PowerShell, cabecera con UTF-8, mensajes seguros, exclusión de AdminSIC,
#          manejo de errores en sugerencias multilingües y porcentaje de batería
# v1.1.1 - Corrección: agregado Pause al final
# =================================================================================
# Version 1.1.1 - 07/10/2026

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Obtener serial y construir nombre personalizado
$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
$Last6 = $Serial.Substring($Serial.Length - 6)
$CustomHost = "BOG" + $Last6

# Cabecera
Write-Host "===================================================================================" -ForegroundColor Cyan
Write-Host "Somos TSS CO. - Despliegue de Aplicaciones" -ForegroundColor Cyan
Write-Host "Version 1.1.1" -ForegroundColor Cyan
Write-Host "Fecha Version 07/10/2026" -ForegroundColor Cyan
Write-Host "Equipo: $CustomHost" -ForegroundColor Cyan
Write-Host "Usuario: $env:USERNAME" -ForegroundColor Cyan
Write-Host "$(Get-Date -Format 'MM/dd/yyyy HH:mm:ss')" -ForegroundColor Cyan
Write-Host "===================================================================================" -ForegroundColor Cyan

try {
    # Copiar imagen de fondo
    $WallpaperSource = "C:\AIMT\Wallpapers\thumb-imgpsh_fullsize_anim.png"
    $WallpaperDest   = "C:\Windows\Web\Screen\thumb-imgpsh_fullsize_anim.png"
    Copy-Item $WallpaperSource $WallpaperDest -Force

    # Configuración Default User (para futuros usuarios)
    reg add "HKU\.DEFAULT\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d $WallpaperDest /f

    try {
        reg add "HKU\.DEFAULT\Software\Microsoft\Input\Settings" /v EnableHwkbTextPrediction /t REG_DWORD /d 1 /f
        reg add "HKU\.DEFAULT\Software\Microsoft\Input\Settings" /v EnableHwkbTextPredictionMultilingual /t REG_DWORD /d 1 /f
        Write-Host "Sugerencias de texto habilitadas (multilingües si hay idiomas instalados)." -ForegroundColor Green
    } catch {
        Write-Host "No aplica: sugerencias multilingües no disponibles." -ForegroundColor Yellow
    }

    try {
        reg add "HKU\.DEFAULT\Software\Microsoft\BatteryFlyout" /v ShowPercentage /t REG_DWORD /d 1 /f
        Write-Host "Porcentaje de batería habilitado." -ForegroundColor Green
    } catch {
        Write-Host "No aplica: equipo de escritorio sin batería." -ForegroundColor Yellow
    }

    # Configuración en todos los usuarios existentes (excepto especiales y AdminSIC)
    Get-ChildItem "C:\Users" | ForEach-Object {
        $UserFolder = $_.FullName
        $UserName   = $_.Name
        if ($UserName -notin @("Default","Public","Administrador","AdminSIC")) {
            if (Test-Path "$UserFolder\NTUSER.DAT") {
                Write-Host "Aplicando configuraciones a $UserName" -ForegroundColor Green
                reg load HKU\TempHive "$UserFolder\NTUSER.DAT"
                reg add "HKU\TempHive\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d $WallpaperDest /f

                try {
                    reg add "HKU\TempHive\Software\Microsoft\Input\Settings" /v EnableHwkbTextPrediction /t REG_DWORD /d 1 /f
                    reg add "HKU\TempHive\Software\Microsoft\Input\Settings" /v EnableHwkbTextPredictionMultilingual /t REG_DWORD /d 1 /f
                } catch {
                    Write-Host "No aplica: sugerencias multilingües no disponibles para $UserName." -ForegroundColor Yellow
                }

                try {
                    reg add "HKU\TempHive\Software\Microsoft\BatteryFlyout" /v ShowPercentage /t REG_DWORD /d 1 /f
                } catch {
                    Write-Host "No aplica: equipo de escritorio sin batería ($UserName)." -ForegroundColor Yellow
                }

                reg unload HKU\TempHive
            }
        }
    }

    Write-Host "Proceso de personalización aplicado correctamente." -ForegroundColor Green
} catch {
    Write-Host "Error en rutina de personalización: $_" -ForegroundColor Red
}

Write-Host "===================================================================================" -ForegroundColor Cyan
Write-Host "Rutina Personalizacion.ps1 finalizada" -ForegroundColor Cyan
Write-Host "===================================================================================" -ForegroundColor Cyan

Pause
