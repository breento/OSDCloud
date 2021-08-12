Write-Host "Hello, Welcome to OSDCLoud"

#Write-Host "Set Resolution"
#Set-DisRes 1600

#Update-Module OSD -Force
#Import-Module OSD -Force



#Write-Host "Starting OSD Cloud"
#Start-OSDCloud

$Uri = 'https://dev.azure.com/breento-devops/test/_apis/git/repositories/test/items?path=OSDCloud/Start-BreentoOSDCloud.ps1&download=true&api-version=6.0'
$script = Invoke-RestMethod -Uri $url -Method Get 
Invoke-Expression $script

