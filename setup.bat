@echo off
rem One-time setup: installs dependencies.
cd /d "%~dp0"
call npm install
if errorlevel 1 (echo. & echo Install failed. & pause & exit /b 1)
if not exist "node_modules\electron\dist\electron.exe" (
  echo.
  echo electron.exe is missing. Check Windows Security protection history, then run setup.bat again.
  pause & exit /b 1
)
echo.
echo Setup done. Double-click start.bat to run, or run autostart-on.bat to start with Windows.
pause
