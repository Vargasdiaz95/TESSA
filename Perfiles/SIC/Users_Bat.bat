@echo off

REM ================================================================================
REM Somos TSS CO. | TESSA
REM Tecnossystem Smart Setup Assistant
REM
REM Modulo : Users-BAT
REM Version: 2.0.0-alpha
REM ================================================================================

echo ================================================================================
echo Somos TSS CO. ^| TESSA
echo Tecnossystem Smart Setup Assistant
echo.
echo Modulo : Users-BAT
echo Version: 2.0.0-alpha
echo Fecha  : 24/10/2026
echo Usuario: %USERNAME%
echo %DATE% %TIME%
echo ================================================================================

echo.
echo Creando usuario OperadorSIC...
echo.

net user OperadorSIC Sic2026* /add

net user OperadorSIC /fullname:"Operador SIC"

net user OperadorSIC /expires:never

net user OperadorSIC /passwordchg:no

echo.
echo Usuario OperadorSIC creado correctamente.
echo.
echo ================================================================================

pause