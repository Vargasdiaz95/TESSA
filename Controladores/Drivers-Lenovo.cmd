@echo off
title TESSA - Drivers Lenovo

powershell.exe ^
    -ExecutionPolicy Bypass ^
    -NoProfile ^
    -File "%~dp0Drivers-Lenovo.ps1"