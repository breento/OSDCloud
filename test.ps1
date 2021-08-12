Write-Host "Hello, TEST"
Update-Module OSD -Force
Import-Module OSD -Force

Write-Host "Starting OSD Cloud"
Start-OSDCloud
