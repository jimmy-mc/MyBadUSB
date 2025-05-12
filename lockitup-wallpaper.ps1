$imgUrl = "https://github.com/jimmy-mc/MyBadUSB/blob/c990363ff721d9de01a5a45cf74ecf3fb3ba163d/lockitup-wallpaper.png"
$wallpaperPath = "$env:USERPROFILE\lockitup-wallpaper.png"

Invoke-WebRequest -Uri $imgUrl -OutFile $wallpaperPath

Add-Type @"
using System.Runtime.InteropServices;
public class Wallpaper {
  [DllImport("user32.dll", SetLastError = true)]
  public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

$SPI_SETDESKWALLPAPER = 20
$SPIF_UPDATEINIFILE = 1
$SPIF_SENDWININICHANGE = 2

[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $wallpaperPath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDWININICHANGE)
