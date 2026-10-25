@echo off
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\claude-hooks.ps1"
echo Start a NEW Claude Code session for it to take effect.
pause
