@echo off
set "img=%TEMP%\lockitup.jpg"
certutil -urlcache -split -f "https://raw.githubusercontent.com/jimmy-mc/MyBadUSB/main/lockitup-wallpaper.jpg" "%img%"
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%img%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
