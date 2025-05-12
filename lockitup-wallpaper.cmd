@echo off
setlocal

set "img=%TEMP%\lockitup.jpg"
set "self=%~f0"

:: Download wallpaper
curl -s -o "%img%" "https://raw.githubusercontent.com/jimmy-mc/MyBadUSB/main/lockitup-wallpaper.jpg"

if exist "%img%" (
    echo Wallpaper downloaded to: %img%
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%img%" /f
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
) else (
    echo Failed to download image to %img%
    pause
)

:: Self-delete safely AFTER image has been handled
(
    echo @echo off
    echo ping -n 3 127.0.0.1 ^>nul
    echo del "%self%"
) > "%TEMP%\_delme.cmd"
start "" /min "%TEMP%\_delme.cmd"
exit
