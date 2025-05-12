@echo off
setlocal
set "img=%TEMP%\lockitup.jpg"
set "me=%~f0"

curl -s -o "%img%" "https://raw.githubusercontent.com/jimmy-mc/MyBadUSB/main/lockitup-wallpaper.jpg" >nul 2>&1

if exist "%img%" (
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%img%" /f >nul 2>&1
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
)

del "%me%" >nul 2>&1
exit
