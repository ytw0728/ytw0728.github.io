$arch = if ($env:PROCESSOR_ARCHITECTURE -eq "AMD64") { "amd64" } else { "arm64" }
$url = "https://ytw0728.github.io/docs/slash/clis/v1.0.0/s-win-$arch.exe"
$dest = "$HOME\AppData\Local\Microsoft\WindowsApps\s.exe"

Write-Host "Downloading my-cli for Windows ($arch)..."
Invoke-WebRequest -Uri $url -OutFile $dest
Write-Host "Done! You can now use 's' in your terminal."