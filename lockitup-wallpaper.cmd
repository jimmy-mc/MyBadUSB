@echo off
set "img=%TEMP%\lockitup.jpg"
curl -o "%img%" "https://raw.githubusercontent.com/jimmy-mc/MyBadUSB/main/lockitup-wallpaper.jpg"
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%img%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
