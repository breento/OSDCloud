Write-Host "Hello, Welcome to OSDCLoud"

Write-Host "Set Resolution"
Set-DisRes 1600

Update-Module OSD -Force
Import-Module OSD -Force



Write-Host "Starting OSD Cloud"
Start-OSDCloud
