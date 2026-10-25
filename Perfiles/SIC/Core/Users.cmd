@echo off
title TESSA - Users

powershell.exe ^
    -ExecutionPolicy Bypass ^
    -NoProfile ^
    -File "%~dp0Users.ps1"