# =================================================================================
# Somos TSS CO. - Rutina de Creacion de Usuario
# =================================================================================
# Historial de versiones:
# v1.0.0 - Script original en .bat
# v1.1.0 - Conversión a PowerShell, cabecera con UTF-8, mensajes seguros
# v1.1.1 - Corrección: contraseña nunca expira y usuario no puede cambiarla
# v1.1.2 - Ajuste: reemplazo de Pause por Read-Host para evitar cierre automático
# =================================================================================
# Version 1.1.2 - 08/10/2026

# Forzar salida en UTF-8 para acentos correctos
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Obtener serial y construir nombre personalizado (solo para mostrar)
$Serial = (Get-CimInstance Win32_BIOS).SerialNumber
$Last6 = $Serial.Substring($Serial.Length - 6)
$CustomHost = "BOG" + $Last6

# Cabecera en consola
Write-Host "===================================================================================" -ForegroundColor Cyan
Write-Host "Somos TSS CO. - Despliegue de Aplicaciones" -ForegroundColor Cyan
Write-Host "Version 1.1.2" -ForegroundColor Cyan
Write-Host "Fecha Version 08/10/2026" -ForegroundColor Cyan
Write-Host "Equipo: $CustomHost" -ForegroundColor Cyan
Write-Host "Usuario: $env:USERNAME" -ForegroundColor Cyan
Write-Host "$(Get-Date -Format 'MM/dd/yyyy HH:mm:ss')" -ForegroundColor Cyan
Write-Host "===================================================================================" -ForegroundColor Cyan

# Creación real del usuario con propiedades
try {
    # Crear usuario
    net user OperadorSIC Sic2026* /add
    net user OperadorSIC /fullname:"Operador SIC"
    net user OperadorSIC /expires:never
    net user OperadorSIC /passwordchg:no

    # Configurar que la contraseña nunca expire
    Set-LocalUser -Name OperadorSIC -PasswordNeverExpires $true

    Write-Host "Usuario OperadorSIC creado correctamente en el equipo $CustomHost." -ForegroundColor Green
    Write-Host "Propiedades aplicadas: contraseña nunca expira y no puede cambiarse." -ForegroundColor Green
} catch {
    Write-Host "Error al crear el usuario: $_" -ForegroundColor Red
}

Write-Host "===================================================================================" -ForegroundColor Cyan
Write-Host "Rutina Users.ps1 finalizada" -ForegroundColor Cyan
Write-Host "===================================================================================" -ForegroundColor Cyan

Write-Host "Presione ENTER para salir..." -ForegroundColor Cyan
Read-Host
