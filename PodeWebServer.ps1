Param(
    $gitpat
)
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module Pode -force
Install-Module Evergreen -force
$PSUrl = Get-EvergreenApp MicrosoftPowershell | Where-Object { $_.Architecture -eq "x64" -and $_.Type -eq "msi" -and $_.Release -eq "Stable" }
$PSUrl.URI 
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri $PSUrl.URI -OutFile "$env:TEMP\$(Split-Path $PSUrl.URI -Leaf)"
Start-Process msiexec -ArgumentList "/i $env:TEMP\$(Split-Path $PSUrl.URI -Leaf) /qn /norestart /l*v `"$($env:TEMP)\PS.MsiInstall.log`" ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0" -Wait
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$gitpat | out-file c:\temp\pat.txt
