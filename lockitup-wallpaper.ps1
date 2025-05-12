$imgUrl = "https://github.com/jimmy-mc/MyBadUSB/blob/3563e57b5e0aae7361ba7fae44710e04d9a4b012/lockitup-wallpaper.jpg"
$wallpaperPath = "$env:USERPROFILE\lockitup-wallpaper.jpg"

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
