@echo off
title TESSA - Hosts

powershell.exe ^
    -ExecutionPolicy Bypass ^
    -NoProfile ^
    -File "%~dp0Hosts.ps1"