@echo off
setlocal
set "img=%TEMP%\lockitup.jpg"
echo Downloading image to: %img%
curl -o "%img%" "https://raw.githubusercontent.com/jimmy-mc/MyBadUSB/main/lockitup-wallpaper.jpg"

if exist "%img%" (
    echo Image downloaded successfully.
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%img%" /f
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
) else (
    echo Failed to download image.
)
endlocal
