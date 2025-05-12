@echo off
setlocal
set "img=%TEMP%\lockitup.jpg"
curl -s -o "%img%" "https://raw.githubusercontent.com/jimmy-mc/MyBadUSB/main/lockitup-wallpaper.jpg" >nul 2>&1

if exist "%img%" (
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%img%" /f >nul 2>&1
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
)

:: Self-delete using a new cmd.exe instance (no "batch file not found" error)
(
    echo @echo off
    echo ping -n 3 127.0.0.1 >nul
    echo del "%%~f0"
) > "%TEMP%\_delme.cmd"
start "" /min "%TEMP%\_delme.cmd"
exit
