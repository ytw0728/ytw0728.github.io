$AppName = "Slash"
$InstallerUrl = "https://ytw0728.github.io/docs/slash/desktops/v1.0.0/Slash_1.0.0_x64-setup.exe"
$TempPath = "$env:TEMP\Slash_setup.exe"

Write-Host "Downloading $AppName..."
Invoke-WebRequest -Uri $InstallerUrl -OutFile $TempPath

# Remove Zone.Identifier to bypass SmartScreen
Unblock-File -Path $TempPath -ErrorAction SilentlyContinue

Write-Host "Running installer (admin permission may be required)..."
Start-Process -FilePath $TempPath -ArgumentList "/S" -Verb RunAs -Wait

Remove-Item -Path $TempPath -Force -ErrorAction SilentlyContinue

Write-Host "Done! $AppName has been installed."
