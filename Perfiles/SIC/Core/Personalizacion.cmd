@echo off
title TESSA - Personalizacion

powershell.exe ^
    -ExecutionPolicy Bypass ^
    -NoProfile ^
    -File "%~dp0Personalizacion.ps1"