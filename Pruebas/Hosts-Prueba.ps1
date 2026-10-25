# =================================================================================
# Somos TSS CO. - Rutina de Actualización de Hosts (Simulación)
# =================================================================================
# Historial de versiones:
# v1.1.1 - Simulación con lista ampliada de plataformas de video
# =================================================================================
# Version 1.1.1 - 07/10/2026

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Obtener serial y construir nombre personalizado (solo para mostrar)
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
    # Bloque de entradas a simular (plataformas de video, excluyendo YouTube Music y Spotify)
    $Entries = @(
        "127.0.0.1 netflix.com",
        "127.0.0.1 www.netflix.com",
        "127.0.0.1 disneyplus.com",
        "127.0.0.1 www.disneyplus.com",
        "127.0.0.1 primevideo.com",
        "127.0.0.1 www.primevideo.com",
        "127.0.0.1 hbomax.com",
        "127.0.0.1 www.hbomax.com",
        "127.0.0.1 paramountplus.com",
        "127.0.0.1 www.paramountplus.com",
        "127.0.0.1 tv.apple.com",
        "127.0.0.1 www.hulu.com",
        "127.0.0.1 www.starplus.com",
        "127.0.0.1 www.crunchyroll.com",
        "127.0.0.1 youtube.com",
        "127.0.0.1 www.youtube.com",
        "127.0.0.1 youtu.be",
        "127.0.0.1 web.whatsapp.com",
        "127.0.0.1 api.whatsapp.com",
        "127.0.0.1 chat.whatsapp.com",
        "127.0.0.1 whatsapp.com"
    )

    Write-Host "[SIMULACIÓN] Se agregarían las siguientes entradas al archivo hosts:" -ForegroundColor Yellow
    $Entries | ForEach-Object { Write-Host "[SIMULACIÓN] $_" -ForegroundColor Green }

    Write-Host "[SIMULACIÓN] Se ejecutaría ipconfig /flushdns" -ForegroundColor Cyan

    Write-Host "[SIMULACIÓN] Hosts actualizado correctamente." -ForegroundColor Magenta
} catch {
    Write-Host "[SIMULACIÓN] Error al actualizar Hosts: $_" -ForegroundColor Red
}

Write-Host "===================================================================================" -ForegroundColor Cyan
Write-Host "Rutina Hosts-Prueba.ps1 finalizada" -ForegroundColor Cyan
Write-Host "===================================================================================" -ForegroundColor Cyan

Pause
