@echo off
rem Launches Dynamic Island with no console window left open.
cd /d "%~dp0"
if not exist "node_modules\electron\dist\electron.exe" (
  echo Run setup.bat first.
  pause & exit /b 1
)
start "" "node_modules\electron\dist\electron.exe" "%~dp0."
