@echo off
rem Starts Dynamic Island every time you sign in to Windows.
cd /d "%~dp0"
powershell -NoProfile -Command "$s=(New-Object -ComObject WScript.Shell).CreateShortcut([Environment]::GetFolderPath('Startup')+'\Dynamic Island.lnk'); $s.TargetPath='%~dp0node_modules\electron\dist\electron.exe'; $s.Arguments='\"%~dp0.\"'; $s.WorkingDirectory='%~dp0'; $s.Save()"
echo Auto-start enabled. Keep this folder where it is.
pause
