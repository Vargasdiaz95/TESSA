# =================================================================================
# Somos TSS CO. - Rutina de Personalización de Entorno (Simulación)
# =================================================================================
# Historial de versiones:
# v1.1.1 - Simulación con Pause al final
# =================================================================================
# Version 1.1.1 - 07/10/2026

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Obtener serial y construir nombre personalizado
$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
$Last6 = $Serial.Substring($Serial.Length - 6)
$CustomHost = "BOG" + $Last6

# Cabecera
Write-Host "===================================================================================" -ForegroundColor Cyan
Write-Host "Somos TSS CO. - Despliegue de Aplicaciones (Simulación)" -ForegroundColor Cyan
Write-Host "Version 1.1.1" -ForegroundColor Cyan
Write-Host "Fecha Version 07/10/2026" -ForegroundColor Cyan
Write-Host "Equipo: $CustomHost" -ForegroundColor Cyan
Write-Host "Usuario: $env:USERNAME" -ForegroundColor Cyan
Write-Host "$(Get-Date -Format 'MM/dd/yyyy HH:mm:ss')" -ForegroundColor Cyan
Write-Host "===================================================================================" -ForegroundColor Cyan

try {
    # Simulación de copia de imagen de fondo
    Write-Host "[SIMULACIÓN] Copiando imagen de fondo a C:\Windows\Web\Screen..." -ForegroundColor Yellow

    # Simulación de configuración Default User
    Write-Host "[SIMULACIÓN] Configurando fondo de pantalla en perfil Default User..." -ForegroundColor Green

    # Simulación de sugerencias de texto
    Write-Host "[SIMULACIÓN] Habilitando sugerencias de texto multilingües..." -ForegroundColor Green

    # Simulación de porcentaje de batería
    Write-Host "[SIMULACIÓN] Mostrando porcentaje de batería en flyout..." -ForegroundColor Green

    # Simulación de aplicación en usuarios existentes
    Get-ChildItem "C:\Users" | ForEach-Object {
        $UserName = $_.Name
        if ($UserName -notin @("Default","Public","Administrador","AdminSIC")) {
            Write-Host "[SIMULACIÓN] Aplicando configuraciones a $UserName..." -ForegroundColor Cyan
        }
    }

    Write-Host "[SIMULACIÓN] Proceso de personalización aplicado correctamente." -ForegroundColor Magenta
} catch {
    Write-Host "[SIMULACIÓN] Error en rutina de personalización: $_" -ForegroundColor Red
}

Write-Host "===================================================================================" -ForegroundColor Cyan
Write-Host "Rutina Personalizacion-Prueba.ps1 finalizada" -ForegroundColor Cyan
Write-Host "===================================================================================" -ForegroundColor Cyan

Pause

