#$ErrorActionPreference = "Stop"
$ErrorActionPreference = 'SilentlyContinue'


# ---------------------------------------------------------------------
# Data
# ---------------------------------------------------------------------

$Bloatware = @(
    "Microsoft.3DBuilder", "Microsoft.Microsoft3DViewer", "Microsoft.AppConnector",
    "Microsoft.BingFinance", "Microsoft.BingNews", "Microsoft.BingSports",
    "Microsoft.BingTranslator", "Microsoft.BingWeather", "Microsoft.BingFoodAndDrink",
    "Microsoft.BingHealthAndFitness", "Microsoft.BingTravel", "Microsoft.GetHelp",
    "Microsoft.Getstarted", "Microsoft.Messaging", "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftSolitaireCollection", "Microsoft.NetworkSpeedTest", "Microsoft.Office.Lens",
    "Microsoft.Office.Sway", "Microsoft.Office.OneNote", "Microsoft.OneConnect",
    "Microsoft.People", "Microsoft.Print3D", "Microsoft.SkypeApp",
    "Microsoft.Wallet", "Microsoft.WindowsAlarms", "Microsoft.windowscommunicationsapps",
    "Microsoft.WindowsFeedbackHub", "Microsoft.WindowsMaps", "Microsoft.WindowsPhone",
    "Microsoft.ConnectivityStore", "Microsoft.CommsPhone", "Microsoft.ScreenSketch",
    "Microsoft.ZuneMusic", "Microsoft.ZuneVideo", "Microsoft.YourPhone",
    "Microsoft.Getstarted", "Microsoft.MicrosoftOfficeHub", "*EclipseManager*",
    "*ActiproSoftwareLLC*", "*AdobeSystemsIncorporated.AdobePhotoshopExpress*",
    "*Duolingo-LearnLanguagesforFree*", "*PandoraMediaInc*", "*CandyCrush*",
    "*BubbleWitch3Saga*", "*Wunderlist*", "*Flipboard*", "*Twitter*",
    "*Facebook*", "*Royal Revolt*", "*Sway*", "*Speed Test*", "*Dolby*",
    "*Viber*", "*ACGMediaPlayer*", "*Netflix*", "*OneCalendar*",
    "*LinkedInforWindows*", "*HiddenCityMysteryofShadows*", "*Hulu*",
    "*HiddenCity*", "*AdobePhotoshopExpress*", "*HotspotShieldFreeVPN*",
    "*Microsoft.Advertising.Xaml*", "MicrosoftTeams*", "Microsoft.OneDriveSync",
    "Microsoft.Todos", "Microsoft.549981C3F5F10_8wekyb3d8bbwe", "Microsoft.Windows.PeopleExperienceHost"
)

$name = Get-Service "WpnUserService_*" | Select-Object -expand name
$servicenum = $name.Substring($name.IndexOf("_")+1)

$services = @(
    "diagnosticshub.standardcollector.service", "DiagTrack",
    "dmwappushsvc", "DPS", "MapsBroker", "NetTcpPortSharing",                
    "RemoteAccess", "RemoteRegistry", "WMPNetworkSvc",
    "WerSvc", "Fax", "fhsvc", "gupdate", "gupdatem",                   
    "MSDTC", "WpcMonSvc", "PhoneSvc", "WPDBusEnum",                        
    "lmhosts", "wisvc", "FontCache", "RetailDemo",                          
    "ALG", "SCardSvr", "EntAppSvc", "edgeupdate",               
    "edgeupdatem", "SEMgrSvc", "BcastDVRUserService_$servicenum",               
    "CaptureService_$servicenum", "HvHost", "vmickvpexchange",
    "vmicguestinterface", "vmicshutdown", "vmicheartbeat",
    "vmicvmsession", "vmicrdv", "vmictimesync" 
)


# ---------------------------------------------------------------------
# Restore Point
# ---------------------------------------------------------------------

Enable-ComputerRestore -Drive "C:\"
Checkpoint-Computer -Description "setupWin11 Script" -RestorePointType "MODIFY_SETTINGS"

# ---------------------------------------------------------------------
# O&O Shutup 10
# ---------------------------------------------------------------------

Start-BitsTransfer "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe"
Start-BitsTransfer "https://raw.githubusercontent.com/fedoz13/win11SetupScript/main/shutup10conf.cfg"
Start-Process -FilePath "./OOSU10.exe" -ArgumentList 'shutup10conf.cfg /quiet' -Wait
Remove-Item -Path ".\OOSU10.exe" -Force
Remove-Item -Path ".\shutup10conf.cfg" -Force

# ---------------------------------------------------------------------
# Design
# ---------------------------------------------------------------------

# Restore Windows 10 context menu
If (!(Test-Path "HKCU:\SOFTWARE\CLASSES\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}")) {
    New-Item -Path "HKCU:\SOFTWARE\CLASSES\CLSID" -Name "{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"
    New-Item -Path "HKCU:\SOFTWARE\CLASSES\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" -Name "InprocServer32"
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\CLASSES\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" -Name "(Default)" -Value ""

# Start menu position left
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -type "Dword" -Value "0"

# Remove Task View from Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -type "Dword" -Value "0"

# Remove Chat from Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarMn" -type "Dword" -Value "0"

# Remove Widgets from Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarDa" -type "Dword" -Value "0"

# Remove Search from Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -type "Dword" -Value "0"

# New Boot Animation
If (!(Test-Path "HKLM:\SYSTEM\ControlSet001\Control\BootControl")) {
    New-Item -Path "HKLM:\SYSTEM\ControlSet001\Control" -Name "BootControl"
}
New-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Control\BootControl" -Name "BootProgressAnimation" -Value "1" -PropertyType "Dword"

# Enable Windows Explorer Compact View
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -type "Dword" -Name "UseCompactMode" -Value "1"

# Enable Windows Dark Theme
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -type "Dword" -Name "SystemUsesLightTheme" -Value "0"

# Enable App Dark Theme
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -type "Dword" -Name "AppsUseLightTheme" -Value "0"


# ---------------------------------------------------------------------
# Debloat
# ---------------------------------------------------------------------

# Disk Cleanup
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\*' | ForEach-Object {
    New-ItemProperty -Path $_.PSPath -Name StateFlags0005 -Value 2 -PropertyType DWord -Force
   };
Start-Process -FilePath CleanMgr.exe -ArgumentList '/sagerun:5' -Wait

# Remove Temp Files
Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue

# Uninstall Bloatware-Apps
foreach ($Bloat in $Bloatware) {
    Get-AppxPackage -Name $Bloat| Remove-AppxPackage
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
}

# Disable Services
foreach ($service in $services) {
    Get-Service -Name $service -ErrorAction SilentlyContinue | Set-Service -StartupType Disabled -ErrorAction SilentlyContinue
    Write-Output Disabling $service...
}


# ---------------------------------------------------------------------
# Privacy
# ---------------------------------------------------------------------

# Disable Tailored Experiences With Diagnostic Data
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" -type "Dword" -Name "TailoredExperiencesWithDiagnosticDataEnabled" -Value "0"

# Disable Telemetry
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "MaxTelemetryAllowed" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\ProgramDataUpdater"
Disable-ScheduledTask -TaskName "Microsoft\Windows\Autochk\Proxy"
Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
Disable-ScheduledTask -TaskName "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name "AutoUpdateEnabled" -Type DWord -Value 0
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Force
}
If (!(Test-Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting")) {
    New-Item -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Force
}
Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "OemPreInstalledAppsEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEverEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353694Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353696Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Type DWord -Value 1


If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo"
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Type DWord -Value 1
Disable-ScheduledTask -TaskName "Microsoft\Windows\Windows Error Reporting\QueueReporting"
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\"
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config"
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Type DWord -Value 0 -Force

Set-NetFirewallProfile -all
netsh advfirewall firewall add rule name="Block Windows Telemetry in" dir=in action=block remoteip=134.170.30.202,137.116.81.24,157.56.106.189,184.86.53.99,2.22.61.43,2.22.61.66,204.79.197.200,23.218.212.69,65.39.117.23,65.55.108.23,64.4.54.254 enable=yes
netsh advfirewall firewall add rule name="Block Windows Telemetry out" dir=out action=block remoteip=65.55.252.43,65.52.108.29,191.232.139.254,65.55.252.92,65.55.252.63,65.55.252.93,65.55.252.43,65.52.108.29,194.44.4.200,194.44.4.208,157.56.91.77,65.52.100.7,65.52.100.91,65.52.100.93,65.52.100.92,65.52.100.94,65.52.100.9,65.52.100.11,168.63.108.233,157.56.74.250,111.221.29.177,64.4.54.32,207.68.166.254,207.46.223.94,65.55.252.71,64.4.54.22,131.107.113.238,23.99.10.11,68.232.34.200,204.79.197.200,157.56.77.139,134.170.58.121,134.170.58.123,134.170.53.29,66.119.144.190,134.170.58.189,134.170.58.118,134.170.53.30,134.170.51.190,157.56.121.89,134.170.115.60,204.79.197.200,104.82.22.249,134.170.185.70,64.4.6.100,65.55.39.10,157.55.129.21,207.46.194.25,23.102.21.4,173.194.113.220,173.194.113.219,216.58.209.166,157.56.91.82,157.56.23.91,104.82.14.146,207.123.56.252,185.13.160.61,8.254.209.254,198.78.208.254,185.13.160.61,185.13.160.61,8.254.209.254,207.123.56.252,68.232.34.200,65.52.100.91,65.52.100.7,207.46.101.29,65.55.108.23,23.218.212.69 enable=yes

Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Input\TIPC" -Name "Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name "HttpAcceptLanguageOptOut" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" -Type DWord -Value 1
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "PeriodInNanoSeconds" -Type QWord -Value ""
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackProgs" -Type DWord -Value 0
If (!(Test-Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput")) {
    New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput" -Force
}
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput" -Name "AllowLinguisticDataCollection" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableTailoredExperiencesWithDiagnosticData" -Type DWord -Value 1
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsSpotlightFeatures" -Type DWord -Value 1
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableThirdPartySuggestions" -Type DWord -Value 1



# ---------------------------------------------------------------------
# Usability
# ---------------------------------------------------------------------

# Default Explorer view This PC
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -type "Dword" -Name "LaunchTo" -Value "1"

# Show file extensions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -type "Dword" -Name "HideFileExt"  -Value "0"

# Install winget
if (!(Test-Path $env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe)){
    $latest = (Invoke-WebRequest -UseBasicParsing -URI "https://github.com/microsoft/winget-cli/releases/latest").Links.Href | Select-String ".msixbundle"
    if ((Get-WmiObject win32_operatingsystem | Select-Object osarchitecture).osarchitecture -like "64*") {
        Start-BitsTransfer "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
    } else {
        Start-BitsTransfer "https://aka.ms/Microsoft.VCLibs.x86.14.00.Desktop.appx"
    }
    
    Start-BitsTransfer "https://github.com$latest"; Add-AppxPackage -Path ".\Microsoft.DesktopAppInstaller_*.msixbundle" -DependencyPath ".\Microsoft.VCLibs*.appx"
}

# Install Windows Terminal
winget install -e Microsoft.WindowsTerminal --accept-source-agreements --accept-package-agreements --force --silent

# Set Windows Terminal as Default Terminal
If (!(Test-Path "HKCU:\Console\%%Startup")) {
    New-Item -Path "HKCU:\Console\%%Startup"
}
Set-ItemProperty -Path "HKCU:\Console\%%Startup" -Name "DelegationConsole" -Type String -Value "{2EACA947-7F5F-4CFA-BA87-8F7FBEEFBE69}"
Set-ItemProperty -Path "HKCU:\Console\%%Startup" -Name "DelegationTerminal" -Type String -Value "{E12CFF52-A866-4C77-9A90-F570A7AA2C6B}"

Remove-Item -Path ".\Microsoft.VCLibs*.appx" -Force
Remove-Item -Path ".\Microsoft.DesktopAppInstaller_*.msixbundle" -Force


# End of Script - Restart PC
Start-Sleep 5
Restart-Computer