@echo off
REM =================================================================================
REM Somos TSS CO. - Rutina de Creacion de Usuario
REM =================================================================================
REM Historial de versiones:
REM v1.0.0 - Script original en .bat
REM =================================================================================
REM Version 1.0.0 - 07/10/2026

echo ================================================================================
echo Somos TSS CO. - Creacion de Usuario
echo Version 1.0.0
echo Fecha Version 07/10/2026
echo Usuario: %USERNAME%
echo %DATE% %TIME%
echo ================================================================================

REM Creación básica del usuario
net user OperadorSIC Sic2026* /add
net user OperadorSIC /fullname:"Operador SIC"
net user OperadorSIC /expires:never
net user OperadorSIC /passwordchg:no

echo Usuario OperadorSIC creado correctamente.
echo ================================================================================

pause