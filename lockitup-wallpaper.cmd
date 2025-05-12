@echo off
setlocal

set "img=%TEMP%\lockitup.jpg"
curl -s -o "%img%" "https://raw.githubusercontent.com/jimmy-mc/MyBadUSB/main/lockitup-wallpaper.jpg"

if exist "%img%" (
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%img%" /f
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
)
exit
