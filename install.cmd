@echo off
REM Knack Starter Pack - Windows bootstrap
REM
REM Wraps install.ps1 with the execution-policy bypass so users don't have
REM to learn PowerShell policy syntax to run the installer. User can either
REM double-click this file from File Explorer or run it from any shell
REM (cmd.exe or PowerShell). %~dp0 resolves to the directory this .cmd is
REM in, so it works regardless of the current working directory.

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1"

echo.
echo Press any key to close this window...
pause >nul
