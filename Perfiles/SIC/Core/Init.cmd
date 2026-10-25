@echo off
title TESSA - Init

powershell.exe ^
    -ExecutionPolicy Bypass ^
    -NoProfile ^
    -File "%~dp0Init.ps1"