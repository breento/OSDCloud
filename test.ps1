Write-Host "Hello, TEST"
Set-DisRes 1600

Update-Module OSD -Force
Import-Module OSD -Force



Write-Host "Starting OSD Cloud"
Start-OSDCloud
