# win11SetupScript

Reverts Windows 11 design flaws, debloats, disables telemetry and adds useful tweaks

## Usage

### :zap: Quick-Run Script
Run from Windows Powershell (Administrator) with one of the following commands:
- <ins>Script Version:</ins>
```
iwr -useb https://raw.githubusercontent.com/fedoz13/win11SetupScript/main/setupWin11.ps1 | iex
```
- <ins>GUI Version (Experimental):</ins>
```
iwr -useb https://raw.githubusercontent.com/fedoz13/win11SetupScript/main/setupWin11GUI.ps1 | iex
```

### :wrench: Download and Run Script
You have to change Powershell Execution-Policy in order to run the script manually:<br>
- <ins>Script Version:</ins>
```
powershell -ExecutionPolicy Bypass -File setupWin11.ps1
```

- <ins>GUI Version (Experimental):</ins>
```
powershell -ExecutionPolicy Bypass -File setupWin11GUI.ps1
```

To change it permanently use: `Set-ExecutionPolicy Unrestricted`


## :warning: Disclaimer
Run this script at your own risk, it is highly experimental and untested. Always manually backup your data before doing so.




