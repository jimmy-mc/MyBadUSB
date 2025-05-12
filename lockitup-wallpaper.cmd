@echo off
setlocal

:: Set variables
set "img=%TEMP%\lockitup.jpg"
set "self=%~f0"

:: Download wallpaper
curl -s -o "%img%" "https://raw.githubusercontent.com/jimmy-mc/MyBadUSB/main/lockitup-wallpaper.jpg" >nul 2>&1

:: Set wallpaper if download succeeded
if exist "%img%" (
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%img%" /f >nul 2>&1
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
)

:: Self-delete using a temp script
set "delcmd=%TEMP%\_delme.cmd"
(
    echo @echo off
    echo ping -n 3 127.0.0.1 ^>nul
    echo del "%self%"
) > "%delcmd%"
start "" /min "%delcmd%"

exit
