Param(
    $gitpat
)
Start-Transcript C:\log.txt
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module Pode -force
Install-Module Evergreen -force
$PSUrl = Get-EvergreenApp MicrosoftPowershell | Where-Object { $_.Architecture -eq "x64" -and $_.Type -eq "msi" -and $_.Release -eq "Stable" }
$PSUrl.URI 
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri $PSUrl.URI -OutFile "$env:TEMP\$(Split-Path $PSUrl.URI -Leaf)"
Start-Process msiexec -ArgumentList "/i $env:TEMP\$(Split-Path $PSUrl.URI -Leaf) /qn /norestart /l*v `"$($env:TEMP)\PS.MsiInstall.log`" ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0" -Wait
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install git -y

Start-Process "C:\Program Files\Git\bin\git.exe" -argumentlist "clone https://anything:$gitpat@dev.azure.com/breento-devops/Evergreen/_git/Evergreen" -wait


$gitpat
Stop-Transcript
