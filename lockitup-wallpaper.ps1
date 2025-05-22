# Change the wallpaper
if ($wp) {
    try {
        $wpPath = "$env:TEMP\wallpaper.jpg"
        Invoke-WebRequest -Uri $wp -OutFile $wpPath -UseBasicParsing
        Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\" -Name Wallpaper -Value $wpPath
        rundll32.exe user32.dll,UpdatePerUserSystemParameters
    } catch {
        Write-Warning "Failed to apply wallpaper: $_"
    }
} 
