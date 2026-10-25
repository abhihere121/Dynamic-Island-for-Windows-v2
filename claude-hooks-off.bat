@echo off
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\claude-hooks.ps1" -Remove
pause
