# ---------------------------------------------------------------------
# Restore Point
# ---------------------------------------------------------------------

Enable-ComputerRestore -Drive "C:\"
Checkpoint-Computer -Description "setupWin11 Script" -RestorePointType "MODIFY_SETTINGS"

# ---------------------------------------------------------------------
# Design
# ---------------------------------------------------------------------

# Restore Windows 10 context menu
New-Item -Path "HKCU:\SOFTWARE\CLASSES\CLSID" -Name "{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"
New-Item -Path "HKCU:\SOFTWARE\CLASSES\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" -Name "InprocServer32"
Set-ItemProperty -Path "HKCU:\SOFTWARE\CLASSES\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" -Name "(Default)" -Value ""

# Start menu position left
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -PropertyType "Dword" -Value "0"

# Remove Task View from Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -PropertyType "Dword" -Value "0"

# Remove Chat from Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarMn" -PropertyType "Dword" -Value "0"

# Remove Widgets from Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarDa" -PropertyType "Dword" -Value "0"

# Remove Search from Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "SearchboxTaskbarMode" -PropertyType "Dword" -Value "0"

# New Boot Animation
New-Item -Path "HKLM:\SYSTEM\ControlSet001\Control" -Name "BootControl"
New-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Control\BootControl" -Name "BootProgressAnimation" -Value "1" -PropertyType "Dword"

# Enable Windows Explorer Compact View
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -PropertyType "Dword" -Name "UseCompactMode" -Value "1"

# Enable Windows Dark Theme
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -PropertyType "Dword" -Name "SystemUsesLightTheme" -Value "0"

# Enable App Dark Theme
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -PropertyType "Dword" -Name "SystemUsesLightTheme" -Value "0"

# Default Explorer view This PC
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -PropertyType "Dword" -Name "LaunchTo" -Value "1"



# ---------------------------------------------------------------------
# Debloat
# ---------------------------------------------------------------------

<#
#Set StateFlags0012 setting for each item in Windows 8.1 disk cleanup utility
if&nbsp; (-not (get-itemproperty -path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders' -name StateFlags0012 -ErrorAction SilentlyContinue)) {
    set-itemproperty -path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\BranchCache' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Memory Dump Files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Old ChkDsk Files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Previous Installations' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Service Pack Cleanup' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Setup Log Files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error memory dump files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error minidump files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Setup Files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Update Cleanup' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Upgrade Discarded Files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\User file versions' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Defender' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Archive Files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Queue Files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Archive Files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Queue Files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows ESD installation files' -name StateFlags0012 -type DWORD -Value 2
    set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Upgrade Log Files' -name StateFlags0012 -type DWORD -Value 2
    }
     
    cleanmgr /sagerun:12
     
    do {
    "waiting for cleanmgr to complete. . ."
    start-sleep 5
    } while ((get-wmiobject win32_process | where-object {$_.processname -eq 'cleanmgr.exe'} | measure).count)
#>


# ---------------------------------------------------------------------
# Privacy
# ---------------------------------------------------------------------



# End of Script - Restart PC
Restart-Computer