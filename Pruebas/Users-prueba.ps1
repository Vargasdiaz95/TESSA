# =================================================================================
# Somos TSS CO. - Rutina de Creación de Usuario (Simulación)
# =================================================================================
# Historial de versiones:
# v1.1.1 - Simulación con propiedades corregidas: contraseña nunca expira y no puede cambiarse
# =================================================================================
# Version 1.1.1 - 07/10/2026

# Forzar salida en UTF-8 para acentos correctos
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Obtener serial y construir nombre personalizado (solo para mostrar)
$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
$Last6 = $Serial.Substring($Serial.Length - 6)
$CustomHost = "BOG" + $Last6

# Cabecera en consola
Write-Host "===================================================================================" -ForegroundColor Cyan
Write-Host "Somos TSS CO. - Despliegue de Aplicaciones (Simulación)" -ForegroundColor Cyan
Write-Host "Version 1.1.1" -ForegroundColor Cyan
Write-Host "Fecha Version 07/10/2026" -ForegroundColor Cyan
Write-Host "Equipo: $CustomHost" -ForegroundColor Cyan
Write-Host "Usuario: $env:USERNAME" -ForegroundColor Cyan
Write-Host "$(Get-Date -Format 'MM/dd/yyyy HH:mm:ss')" -ForegroundColor Cyan
Write-Host "===================================================================================" -ForegroundColor Cyan

# Simulación de creación de usuario
Write-Host "[SIMULACIÓN] Creando usuario: OperadorSIC" -ForegroundColor Yellow
Write-Host "[SIMULACIÓN] Contraseña asignada: Sic2026*" -ForegroundColor Yellow
Write-Host "[SIMULACIÓN] Nombre completo: Operador SIC" -ForegroundColor Yellow

# Simulación de propiedades
Write-Host "[SIMULACIÓN] Configurando que la contraseña nunca expire..." -ForegroundColor Green
Write-Host "[SIMULACIÓN] Configurando que el usuario no pueda cambiar la contraseña..." -ForegroundColor Green

# Simulación de pertenencia a grupo
Write-Host "[SIMULACIÓN] Agregando OperadorSIC al grupo 'Users'..." -ForegroundColor Cyan

# Confirmación final
Write-Host "[SIMULACIÓN] Usuario OperadorSIC creado correctamente en el equipo $CustomHost." -ForegroundColor Magenta
Write-Host "[SIMULACIÓN] Propiedades aplicadas: contraseña nunca expira y no puede cambiarse." -ForegroundColor Magenta

Write-Host "===================================================================================" -ForegroundColor Cyan
Write-Host "Rutina Users-Prueba.ps1 finalizada" -ForegroundColor Cyan
Write-Host "===================================================================================" -ForegroundColor Cyan

Pause
