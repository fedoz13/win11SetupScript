Add-Type -AssemblyName System.Windows.Forms
$ErrorActionPreference = 'SilentlyContinue'

$resources = & { $BinaryFormatter = New-Object -TypeName System.Runtime.Serialization.Formatters.Binary.BinaryFormatter
	@{ 
		'FontDialog1.TrayLocation' = New-Object -TypeName System.Drawing.Point -ArgumentList @(17, 17)
		'Button9.Name' = 'Button9'
		'Button13.Name' = 'Button13'
		'Button25.Name' = 'Button25'
		'Button7.Name' = 'Button7'
		'Button16.Name' = 'Button16'
		'PictureBox1.Name' = 'PictureBox1'
		'Button4.Name' = 'Button4'
		'FontDialog1.Name' = 'FontDialog1'
		'Button26.Name' = 'Button26'
		'Button12.Name' = 'Button12'
		'Button2.Name' = 'Button2'
		'Button20.Name' = 'Button20'
		'Button21.Name' = 'Button21'
		'Button1.Name' = 'Button1'
		'PictureBox1.Image' = New-Object -TypeName System.Drawing.Bitmap -ArgumentList @(New-Object -TypeName  System.IO.MemoryStream -ArgumentList @(,[System.Convert]::FromBase64String('iVBORw0KGgoAAAANSUhEUgAAALUAAAAkCAYAAADPaXtPAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH5gQWEjAH0rso8gAADxJJREFUeF7tnAmQXVURhh8gS0JmJuwgKMgiCgIiyiKgEGYIm1oqhRtCsbggmxuoaLkg4oaAK1ogKoqiiCKbCIiKIiBLJgkgiLKKCKiAyL75fW/uSTqd82ZeIiky5furvkp4t+99797bp093nxNaPfXUU0/jUYvAUs2fz5j6pw+1+ofBPwPzqv4ZnAd9/+N1epp36UDPqjCWYy0K+Rw/G02LQbFdvKF8zxbwTbgAvg4vhgWqvuHtWgPTt8fRBudwujY65PShJWAlWNrPOmniFVNbAzMHW5PaAyFdi8/6Zgwtzt9XhD4/62nB69nwLTgDToefwQ/ghdBJzwUd8CcNP22YCp20GZwK5TvOhq9CP6wN18BTgUvB3/a0q+1sM6fMdrwZOvbQUrAqbA57wGfgTLgCtoTm7NnCWVuTGRjFkSe3B8Lgkvx9FdgUdocj4XS4CgahOXt8aSK8ADYFI9PCrjXgbxAd6kHYCjrpAxDtC++FmozGx0G2/xyoPSAfewC2hqddOtakaTv45/qwLxwD58L1cB88CU813AZrQnP2bOnUAyNOvS7H94aj4By4Du6BJ6Bc5y5YD5qzF34tC6+Dz8Iv4U44CcaDU68Gf4HoUPdDJ4d6DlwN0b7wEahpHbgJou2tsD4oI7xOHI//CdaEp10jkXXQ1OK0xuFG40JSiIn82Zw9W+bKsBjHTgr2nbgUBqA5e+HXO+AxiC/lQzAetCJkJ/0PvBJqeg88CdG+cDjUZATPtl+AoiXhw3Az/BOugl1hgUjHAlMEI2rNASNfGrhmKrnxYHP2bHFMloNpje1onEgOvwh/Nmcv3HJqPR7iC3sEXgXjQZPhMoi/36i5DWStAtMg2kaOgqxl4PcQ7Ux3NoIoi8y1YGNwoC0w6ViwFTwIOtwDcBOYImRn3Adakykos/wcNgFTFm293s1wR/PfkYOhNemq7Zqz509W2LaHloCxKvks04Zuz50El0B8abeDxc8zLbsLRsHRZA3wK4i/35x6CmTtD09AtItR265F1qvhISg2YoE4VqdkfuU9+946SueCKXAc7A/bwNpwNkRH1Fm3gKoz+nlz3OscCNvBWnAqxOvo7B5r9U2bO+KPpZVhd/gyWGWfDz+H78BHYSfo9JIngC/SKfRH4LnnwInwTrDij3opvBs+Af+C+NKMRB+D98EhsDmoVeFAeH+DBdfrIb/g5cDvjHbeV3xZLwevbzrg9H4wrA7KaPdJOAt+ATqR91bL8b2mzyj+fp0wP32j5x+g2BjNc9T+HsR70cFOhmhzF1hEF1mPmL6Vez0U9gSDSpQF7UFQ7lfbkiL5nXZXPgVnwrmgD9gmnEv9RN2BGYOLLXvDjsUxZQW4GqIzmp6YpjRnzik/h0UnXTlHG8+8+XKI12EWGFzDXH5eZDQ1IvjQH4f4ECMedzrM8oHoyP+G2nkyDDtAUa2ar2Ekewso88QY6eRrkOXd5+j2Y3D2KfKlxeP+dl/yvvDX5rOIA89Im2cer2kAiLYPQ36Tb4P4bH2WPrN4nteJv9Fe898h2hgkoo1pTi4SHYw52voMcy7vYDd9OhIcLPGYWIxuC3MIJ8Op7VoMtTY/qd3OE1twdiyiM54BFpTNmXPKzwt9I90U2QByGnMBTIDmzO60I9hxyDeVsf+ao9Ub4Dao2WeuA9OKPrCPWrPJ+LA3AOUskI/rhFnOANnuMCgyAmZHvAOOBYu8+HlEByuzRpFRzggb7awJYs/ZmSPnxUZMvy9+ZoSMzugsFo/fA7mr4kCLNnIEZNlZiTYOMGeq/NszDryO6UhY7dsTYitPjgCOjR1hR+za7AqPQbzOse0VyhndO7U57XkQb8QoZ3P/GLCI84XYpoqOoYzueYTfAJ8GpzrTjxwd3gX2oW1R6UB5ZtDe77oPPG6LzwWGWkTUJk+RRlKjWbTTyXaBImebKyDblBz3FrgRarNWrZhztog2j0KclUwHYnfHhRJTqTxIfw1LgzIVnA7x+PchO9g3INr4Pbnz4cAzhcx2f2z+7mDxveWIL9r4W6rqHyZSz2inD0cnR3wcdoO2s46lkTZh2/ZwiNdxoOwFrb7h+EhH14aQHdOpujxcNQBOczpjkZX2TIjnOaXG5Vkr9Lsh2nwedFKd0UFhGyoe19l3BiOieW9ZmfPBXgvR1gduRyHK35pnAdOJ50ORf6+lGPfCB+F5YH5tLp1tLArjs1H216ONTu3sp5zefwPxuN+hzH/j5/5u7ZU1QBwIpkc55Dnj/RbiNZxxy8xW5PO+GKJdwdVJF4p8vuba/vZ4/M/gAKxKZwNTg/MgOuPdsCE0lqOrHYmH28vhrh7G69wLm0FrYGat9q7L6czIGG9Ep7bwG021qTH3bV4DefTHaO/Dz05voRJzxiLzdp0u2hq5TSWiHASmEtHOF68DFFmKG5WjjQ6kk0W9CHJaZvRcHqI+DtFGx7CoVm8EZ4FyzBTMQaMs8OJ55doW4y67x2Mup+fiz0WZnPpdDrnu6TSIXXaP9+JiTr7f2vVmSWeD1eFGiM54JU66rM7ajbCXleHa5vyC/+3njWV3Wg+yE5h+uDfBl1qTIzfvNTAftBI30qwLb4cyvRVMF+KihC88T/FW4DXtBTmVsUORZfSPTiQWpVGmRvG4XAT55Rm9dMJoZ8GbndrIG20cIKY7Boac2sVVwzdBLHxdBbRL4iwWO0IGhpg+FTmjWZQWOzHNyN0gz812pht5f0otwP0Qqiu7E6fPKu62BXvV0RlP7h8eXJQ/G+vOmjA8ax+JEdnIHK9j5DaCN9bdyaiQ862CuaVRaAWIcmrND8mIcSGYghgVcpfC/7Ywii1BC5poo4PvBjWZ30fbWu6oXFmLdmJ7r8ic+wSIxx0s5vpZLmmbW0dbUwnrkKhcrBWndgEpdmF0WtO2Ip0yTvc+b1tvrhaWz8TaJKc8ylkv2klt/0jNrlZM7gM5cNjKrWqJmTsXZzwAoiPKodDeyTeWJk+fWq5j7pyLTXNsjs1bO085HTrt5xsquIMsFgtW7jW7Gl7TvRFGM3O7oloHwtzeHD/LiGffO9rWckeLqHxNc9G4ucicu7ZC54yVZcR0dom234bc1nNDURzEOvVbIf8WU7ao3I5z0clqKM4OBo/a4DV62o0qdmJKlVNAUzmjbbSzAJ+rVYe+CNHOAfdaqMrOx1Ijrb3jgxPKw7Aj4NRjO6PXGRhxajdGxevYBbEb0nb6+ZFtJ3PKPN0W4lRvipCP+/B1AHNkiz1XCd2UZN4Yo1PRSpD3TFwJpjBZFm05Ytq9yLYu6OS+7vUQCx2n3LyrrhZ9VU4rZD/I8sXryMXG6GyRGWsAB3YsVpW/N6YZOrWOFa/l7BeDQZH3njs4Ft15E5OzbO6i+FvyYpgro3aaop3PsmyamktNcdePw10M0RndmbcONJajq7mOxeb5zfmFO8G+dWM5/zJqO9Xn9MLoVh6uzfp4zBzWFSpXuoy0OqERMed2UfmFSq0Prmq53ikQbS2iammUCxEx5anl3F+BLHff5RU/06paRDe6xjTC35odqVYr2E2K9cw/INYhXtMuSE06Wx7ADgCdM6r2nM3zcyPA9553AnZTJLpt9HaIzngRTILGcnRpB7Vi073Yy0Bj2Z1qXQZlp+B3EG/QqFo2ytQKrVoEKzKq5LaQiza5SCz7g7NcDcs5urNAkU5rAZYHouRr5kUI0yNzySjz19x7Fj+rDTp7TbGb4n3FgWMErf2jAQe/eXQ8L0Zp23C1mUu5uJPv1yX1rJwaiUErq9YR8hlXA1O7Pz3ijLvAIxCd8biJl40soY8ld+9pB+4lycXmd/unb99VsRllceQWT/vJRmGd3JdmFMipgVNTKVbsYOTIadriNOx0Z5Q2BzdKuKfC3m4uAGsDwzTAh2shqtOXFlbN1qjpQDLf9OHXHDo7rPeXl6a9Dws2v8vB7L4P8+boXGIa02kqrrUbI/axa/IZ5Q5RQQd3ab2T3gzZWX0HPjefSRlER0O08ZnsDVm+p2gn7rupqn94VnF3WOOAkf2gNeG2LRvrzuqfNrLcDgc150YOga6KzSKjm204f7xFl+nFaQ2+wHyDsap2ALjRJ9tY9MwAFxFs+bm318/NtXXwKF9YPl+8hg7l6lmJikabWhHrSy3R3n0KuR4w8sQn4oDz90Ubz/d+Xc0zMuYpXfysY8GELFhreyfErlCn1qhTu1N87TzzZeuOTnIjV7n3iM/OAfYKsHDOBXa3q7DWBR2X8HQ2cIP/KRAd8X7YGlp914ztjNoNDE9xn/QJEK/zEEwFCsnuOx/++7Wa89YwullIRtlRyMVbJ3TwvMf3ZWAOWbMXN9sUGSFriwcFp3dngtwT1tGiQ20COb8cC9twozm0shDu9PuMlLlbUlTbtioOYHcjjibvKxe8hbIKaHqTV2wd+PnfLjqz5j3hDsaO2391NlgehiE64w2wGjSWo0s7sNi8BOJ1bgW3szaW3cnpSWerjXbxcxv0tqE6bTp3fnHbZadNQEYFuyCmADkXNRWwB1rb2aezx7sxr3OmyFO8Ud1WpNO/g87uidHbAqtEYAu+IouuPGXX0MZc1w5Gx+o/yH62juR3+t3l+71G3swfZVvTlUOdOJ5ngdpxabqRz8TWal6RlbIqa6j0+Rq9vbbfY5sx7x/RF3Ti8vu1c7DVOkJt6WywEbih39bbo2CP+ay+kX+E21iOLu3AYvMWcL+I1/HfJl4IXRebRT5QV/6cxmxdWTy4Sd0XqSO72tfNv3EzD7VQMrK6uOL5bmiylafTl70MNflwnVt0bltZ5p7myU6PeUnYl2Rv1UUDN/G4GchiqTx47c31zccLTsGx8+G+k/jydV6nXReY7ICI1zVftf02WvcmqvbdLpO7f6VWWBYZwV8C2sbzuv3fG3htB7S77Xx2PkdXXsvs5MCwXii4IFRbBzAgmGpEO2e1TjNMcUYjtSmCPWnZCTacNG2brlMG7MUOxxDE62zcN3NokXnZmff/KB2v1BAFZ5K8lbSnLoTTdaSvvew9T05dxX9t3nPq0VVShOjUtV1+PfU0buSSdM793XaZd/n11NO40QEQHVpqu/x66mncKP9vGOwI1DYK9dTTuFCtD2vbsNOiSE89LfRyBdRlYFuVtu/ELQId+7A99dRTTz311FNPPfU0h1qt/wJqCwYBsxlB6QAAAABJRU5ErkJggg==')))
		'Button30.Name' = 'Button30'
		'Button31.Name' = 'Button31'
		'Label3.Name' = 'Label3'
		'Button6.Name' = 'Button6'
		'Button5.Name' = 'Button5'
		'Button22.Name' = 'Button22'
		'Button36.Name' = 'Button36'
		'ProgressBar1.Name' = 'ProgressBar1'
		'Label1.Name' = 'Label1'
		'Panel4.Name' = 'Panel4'
		'Button15.Name' = 'Button15'
		'ToolStripProgressBar1.Name' = 'ToolStripProgressBar1'
		'Button3.Name' = 'Button3'
		'$this.Name' = 'Form1'
		'Button11.Name' = 'Button11'
		'StatusStrip1.Name' = 'StatusStrip1'
		'ToolTip1.TrayLocation' = New-Object -TypeName System.Drawing.Point -ArgumentList @(159, 17)
		'Button24.Name' = 'Button24'
		'Button19.Name' = 'Button19'
		'StatusStrip1.TrayLocation' = New-Object -TypeName System.Drawing.Point -ArgumentList @(17, 17)
		'Button14.Name' = 'Button14'
		'Panel2.Name' = 'Panel2'
		'Button27.Name' = 'Button27'
		'Panel1.Name' = 'Panel1'
		'Panel3.Name' = 'Panel3'
		'Button10.Name' = 'Button10'
		'Label4.Name' = 'Label4'
		'PictureBox1.BackgroundImage' = New-Object -TypeName System.Drawing.Bitmap -ArgumentList @(New-Object -TypeName  System.IO.MemoryStream -ArgumentList @(,[System.Convert]::FromBase64String('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')))
		'Button18.Name' = 'Button18'
		'$this.Icon' = New-Object -TypeName System.Drawing.Icon -ArgumentList @(New-Object -TypeName  System.IO.MemoryStream -ArgumentList @(,[System.Convert]::FromBase64String('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')))
		'Button23.Name' = 'Button23'
		'ToolTip1.Name' = 'ToolTip1'
		'TextBox1.Name' = 'TextBox1'
		'Button8.Name' = 'Button8'
		'Button17.Name' = 'Button17'
		'Label2.Name' = 'Label2'
	}
}

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

$Form1_Load = {
	$toolTip1.SetToolTip($Button17, "Removes Task View, Chat, Widgets and Search from Taskbar`r`n(Run after Shutup 10 to keep changes)");
}

$Button36_Click = {
	Start-Sleep 2
	Restart-Computer
}

$Button27_Click = {
	[System.Windows.Forms.MessageBox]::Show("Made by Kevin Rossmeier`r`nhttps://github.com/fedoz13/","About",0)
}

$Button25_Click = {
	$TextBox1.AppendText("Not implemented.")
}

$Button21_Click = {
	$ProgressBar1.Maximum = 100
	$ProgressBar1.Value = 0
	$TextBox1.AppendText("Creating Restore Point...`r`n")
	Enable-ComputerRestore -Drive "C:\"
	$output = Checkpoint-Computer -Description "setupWin11 Script" -RestorePointType "MODIFY_SETTINGS" | Out-String
	#$output = (Checkpoint-Computer -Description "setupWin11 Script" -RestorePointType "MODIFY_SETTINGS") -join "`n";
	$TextBox1.AppendText($output)
	$ProgressBar1.Value = 100
}

$Button20_Click = {
	$TextBox1.AppendText("Not implemented.")
}

$Button19_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 10
	# Default Explorer view This PC
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -type "Dword" -Name "LaunchTo" -Value "1"
	$ProgressBar1.PerformStep()
}

$Button18_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 10
	# Show file extensions
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -type "Dword" -Name "HideFileExt"  -Value "0"
	$ProgressBar1.PerformStep()
}

$Button17_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 20
	# Remove Task View from Taskbar
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -type "Dword" -Value "0"
	$ProgressBar1.PerformStep()
	
	# Remove Chat from Taskbar
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarMn" -type "Dword" -Value "0"
	$ProgressBar1.PerformStep()
	
	# Remove Widgets from Taskbar
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarDa" -type "Dword" -Value "0"
	$ProgressBar1.PerformStep()
	
	# Remove Search from Taskbar
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -type "Dword" -Value "0"
	$ProgressBar1.PerformStep()
}

$Button16_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 25
	$ProgressBar1.PerformStep()
	# Install Windows Terminal
	winget install -e Microsoft.WindowsTerminal --accept-source-agreements --accept-package-agreements --force --silent
	$ProgressBar1.PerformStep()
	
	# Set Windows Terminal as Default Terminal
	If (!(Test-Path "HKCU:\Console\%%Startup")) {
	    New-Item -Path "HKCU:\Console\%%Startup"
	}
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKCU:\Console\%%Startup" -Name "DelegationConsole" -Type String -Value "{2EACA947-7F5F-4CFA-BA87-8F7FBEEFBE69}"
	Set-ItemProperty -Path "HKCU:\Console\%%Startup" -Name "DelegationTerminal" -Type String -Value "{E12CFF52-A866-4C77-9A90-F570A7AA2C6B}"
	$ProgressBar1.PerformStep()
	
	Remove-Item -Path ".\Microsoft.VCLibs*.appx" -Force
	Remove-Item -Path ".\Microsoft.DesktopAppInstaller_*.msixbundle" -Force
	$ProgressBar1.PerformStep()
}

$Button15_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 10
	# Enable Windows Dark Theme
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -type "Dword" -Name "SystemUsesLightTheme" -Value "0"
	$ProgressBar1.PerformStep()
	
	# Enable App Dark Theme
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -type "Dword" -Name "AppsUseLightTheme" -Value "0"
	$ProgressBar1.PerformStep()
}

$Button14_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 15
	$ProgressBar1.PerformStep()
	If (!(Test-Path "HKLM:\SYSTEM\ControlSet001\Control\BootControl")) {
		New-Item -Path "HKLM:\SYSTEM\ControlSet001\Control" -Name "BootControl"
	}
	$ProgressBar1.PerformStep()
	New-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Control\BootControl" -Name "BootProgressAnimation" -Value "1" -PropertyType "Dword"
	$ProgressBar1.PerformStep()
}

$Button13_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 10
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -type "Dword" -Value "0"
	$ProgressBar1.PerformStep()
}

$Button12_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 10
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -type "Dword" -Name "UseCompactMode" -Value "1"
	$ProgressBar1.PerformStep()
}

$Button11_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 15
	$ProgressBar1.PerformStep()
	If (!(Test-Path "HKCU:\SOFTWARE\CLASSES\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}")) {
    	New-Item -Path "HKCU:\SOFTWARE\CLASSES\CLSID" -Name "{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"
    	New-Item -Path "HKCU:\SOFTWARE\CLASSES\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" -Name "InprocServer32"
	}
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKCU:\SOFTWARE\CLASSES\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" -Name "(Default)" -Value ""
	$ProgressBar1.PerformStep()
}

$Button10_Click = {
	$TextBox1.AppendText("Not implemented.")
}

$Button9_Click = {
	$TextBox1.AppendText("Not implemented.")
}

$Button8_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 20
	$TextBox1.AppendText("Downloading O&OShutup...`r`n")
	Start-BitsTransfer "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe"
	$ProgressBar1.PerformStep()
	$TextBox1.AppendText("Downloading Config file...`r`n")
	Start-BitsTransfer "https://raw.githubusercontent.com/fedoz13/win11SetupScript/main/shutup10conf.cfg"
	$ProgressBar1.PerformStep()
	$TextBox1.AppendText("Running O&OShutup...`r`n")
	Start-Process -FilePath "./OOSU10.exe" -ArgumentList 'shutup10conf.cfg /quiet' -Wait
	$ProgressBar1.PerformStep()
	$TextBox1.AppendText("Cleanup...`r`n")
	Remove-Item -Path ".\OOSU10.exe" -Force
	Remove-Item -Path ".\shutup10conf.cfg" -Force
	$ProgressBar1.PerformStep()
	$TextBox1.AppendText("Done.`r`n")
}

$Button7_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 20
	$ProgressBar1.PerformStep()
	Set-NetFirewallProfile -all
	$ProgressBar1.PerformStep()
	$TextBox1.AppendText("Block Telemetry in...`r`n")
	netsh advfirewall firewall add rule name="Block Windows Telemetry in" dir=in action=block remoteip=134.170.30.202,137.116.81.24,157.56.106.189,184.86.53.99,2.22.61.43,2.22.61.66,204.79.197.200,23.218.212.69,65.39.117.23,65.55.108.23,64.4.54.254 enable=yes
	$ProgressBar1.PerformStep()
	$TextBox1.AppendText("Block Telemetry out...`r`n")
	netsh advfirewall firewall add rule name="Block Windows Telemetry out" dir=out action=block remoteip=65.55.252.43,65.52.108.29,191.232.139.254,65.55.252.92,65.55.252.63,65.55.252.93,65.55.252.43,65.52.108.29,194.44.4.200,194.44.4.208,157.56.91.77,65.52.100.7,65.52.100.91,65.52.100.93,65.52.100.92,65.52.100.94,65.52.100.9,65.52.100.11,168.63.108.233,157.56.74.250,111.221.29.177,64.4.54.32,207.68.166.254,207.46.223.94,65.55.252.71,64.4.54.22,131.107.113.238,23.99.10.11,68.232.34.200,204.79.197.200,157.56.77.139,134.170.58.121,134.170.58.123,134.170.53.29,66.119.144.190,134.170.58.189,134.170.58.118,134.170.53.30,134.170.51.190,157.56.121.89,134.170.115.60,204.79.197.200,104.82.22.249,134.170.185.70,64.4.6.100,65.55.39.10,157.55.129.21,207.46.194.25,23.102.21.4,173.194.113.220,173.194.113.219,216.58.209.166,157.56.91.82,157.56.23.91,104.82.14.146,207.123.56.252,185.13.160.61,8.254.209.254,198.78.208.254,185.13.160.61,185.13.160.61,8.254.209.254,207.123.56.252,68.232.34.200,65.52.100.91,65.52.100.7,207.46.101.29,65.55.108.23,23.218.212.69 enable=yes
	$ProgressBar1.PerformStep()
	$TextBox1.AppendText("Done.`r`n")
}

$Button6_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 80
	Disable Tailored Experiences With Diagnostic Data
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" -type "Dword" -Name "TailoredExperiencesWithDiagnosticDataEnabled" -Value "0"
	$ProgressBar1.PerformStep()
	
	# Disable Telemetry
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "MaxTelemetryAllowed" -Type DWord -Value 0
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
	$ProgressBar1.PerformStep()
	Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
	Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\ProgramDataUpdater"
	Disable-ScheduledTask -TaskName "Microsoft\Windows\Autochk\Proxy"
	Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
	Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
	Disable-ScheduledTask -TaskName "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 0
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 0
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0
	Set-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name "AutoUpdateEnabled" -Type DWord -Value 0
	$ProgressBar1.PerformStep()
	If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules")) {
		New-Item -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Force
	}
	$ProgressBar1.PerformStep()
	If (!(Test-Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting")) {
		New-Item -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Force
	}
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "OemPreInstalledAppsEnabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEnabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEverEnabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Type DWord -Value 0
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353694Enabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353696Enabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
	$ProgressBar1.PerformStep()
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force
	}
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Type DWord -Value 1
	
	$ProgressBar1.PerformStep()
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo"
	}
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Type DWord -Value 1
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Type DWord -Value 1
	Disable-ScheduledTask -TaskName "Microsoft\Windows\Windows Error Reporting\QueueReporting"
	$ProgressBar1.PerformStep()
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\"
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config"
	}
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Type DWord -Value 0 -Force
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Input\TIPC" -Name "Enabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name "HttpAcceptLanguageOptOut" -Type DWord -Value 1
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "PeriodInNanoSeconds" -Type QWord -Value ""
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackProgs" -Type DWord -Value 0
	$ProgressBar1.PerformStep()
	If (!(Test-Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput")) {
    	New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput" -Force
	}
	$ProgressBar1.PerformStep()
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput" -Name "AllowLinguisticDataCollection" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableTailoredExperiencesWithDiagnosticData" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsSpotlightFeatures" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableThirdPartySuggestions" -Type DWord -Value 1
	$ProgressBar1.PerformStep()
	$TextBox1.AppendText("Disabled Telemetry, Tracking & Privacy Settings`r`n")
}

$Button5_Click = {
	$TextBox1.AppendText("Not implemented.")
}


$Button4_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 100
	foreach ($service in $services) {
    	Get-Service -Name $service -ErrorAction SilentlyContinue | Set-Service -StartupType Disabled -ErrorAction SilentlyContinue
		$TextBox1.AppendText("Disabling $service...`r`n")
		$ProgressBar1.PerformStep()
	}
}

$Button3_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 320
	foreach ($Bloat in $Bloatware) {
    	Get-AppxPackage -Name $Bloat| Remove-AppxPackage
    	Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
		$TextBox1.AppendText("Removing $Bloat...`r`n")
		$ProgressBar1.PerformStep()
	}
	$TextBox1.AppendText("Successfully uninstalled Bloatware.`r`n")

}

$Button2_Click = {
	$ProgressBar1.Value = 0
	$ProgressBar1.Maximum = 10
	$TextBox1.AppendText("Cleaning up C:\Windows\Temp\...`r`n")
	Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
	$ProgressBar1.PerformStep()
	$TextBox1.AppendText("Cleaning up %temp%...`r`n")
	Remove-Item $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue
	$ProgressBar1.PerformStep()
	$TextBox1.AppendText("Done.`r`n")
}

$Button1_Click = {
	$ProgressBar1.Value = 0
    $ProgressBar1.Maximum = 150
    $TextBox1.AppendText("Running Disk Cleanup...`r`n")
    Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\*' | ForEach-Object {
        New-ItemProperty -Path $_.PSPath -Name StateFlags0005 -Value 2 -PropertyType DWord -Force
		$ProgressBar1.PerformStep()
       };
    Start-Process -FilePath CleanMgr.exe -ArgumentList '/sagerun:5' -Wait
	$ProgressBar1.Value = 150
    $TextBox1.AppendText("Finished Disk Cleanup`r`n")
}


$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.PictureBox]$PictureBox1 = $null
[System.Windows.Forms.Panel]$Panel1 = $null
[System.Windows.Forms.Button]$Button1 = $null
[System.Windows.Forms.Label]$Label2 = $null
[System.Windows.Forms.Button]$Button2 = $null
[System.Windows.Forms.Button]$Button3 = $null
[System.Windows.Forms.Button]$Button4 = $null
[System.Windows.Forms.Button]$Button5 = $null
[System.Windows.Forms.Label]$Label1 = $null
[System.Windows.Forms.TextBox]$TextBox1 = $null
[System.Windows.Forms.ProgressBar]$ProgressBar1 = $null
[System.Windows.Forms.Panel]$Panel2 = $null
[System.Windows.Forms.Button]$Button6 = $null
[System.Windows.Forms.Button]$Button7 = $null
[System.Windows.Forms.Button]$Button8 = $null
[System.Windows.Forms.Button]$Button9 = $null
[System.Windows.Forms.Button]$Button10 = $null
[System.Windows.Forms.Button]$Button22 = $null
[System.Windows.Forms.Panel]$Panel3 = $null
[System.Windows.Forms.Label]$Label3 = $null
[System.Windows.Forms.Button]$Button11 = $null
[System.Windows.Forms.Button]$Button12 = $null
[System.Windows.Forms.Button]$Button13 = $null
[System.Windows.Forms.Button]$Button14 = $null
[System.Windows.Forms.Button]$Button15 = $null
[System.Windows.Forms.Panel]$Panel4 = $null
[System.Windows.Forms.Label]$Label4 = $null
[System.Windows.Forms.Button]$Button16 = $null
[System.Windows.Forms.Button]$Button17 = $null
[System.Windows.Forms.Button]$Button18 = $null
[System.Windows.Forms.Button]$Button19 = $null
[System.Windows.Forms.Button]$Button20 = $null
[System.Windows.Forms.Button]$Button23 = $null
[System.Windows.Forms.ToolTip]$ToolTip1 = $null
[System.ComponentModel.IContainer]$components = $null
[System.Windows.Forms.Button]$Button21 = $null
[System.Windows.Forms.Button]$Button36 = $null
[System.Windows.Forms.Button]$Button25 = $null
[System.Windows.Forms.Button]$Button27 = $null
function InitializeComponent
{
$components = (New-Object -TypeName System.ComponentModel.Container)
#$resources = . (Join-Path $PSScriptRoot 'setupwin11gui.resources.ps1')
$PictureBox1 = (New-Object -TypeName System.Windows.Forms.PictureBox)
$Panel1 = (New-Object -TypeName System.Windows.Forms.Panel)
$Button1 = (New-Object -TypeName System.Windows.Forms.Button)
$Label2 = (New-Object -TypeName System.Windows.Forms.Label)
$Button2 = (New-Object -TypeName System.Windows.Forms.Button)
$Button3 = (New-Object -TypeName System.Windows.Forms.Button)
$Button4 = (New-Object -TypeName System.Windows.Forms.Button)
$Button5 = (New-Object -TypeName System.Windows.Forms.Button)
$Label1 = (New-Object -TypeName System.Windows.Forms.Label)
$TextBox1 = (New-Object -TypeName System.Windows.Forms.TextBox)
$ProgressBar1 = (New-Object -TypeName System.Windows.Forms.ProgressBar)
$Panel2 = (New-Object -TypeName System.Windows.Forms.Panel)
$Button6 = (New-Object -TypeName System.Windows.Forms.Button)
$Button7 = (New-Object -TypeName System.Windows.Forms.Button)
$Button8 = (New-Object -TypeName System.Windows.Forms.Button)
$Button9 = (New-Object -TypeName System.Windows.Forms.Button)
$Button10 = (New-Object -TypeName System.Windows.Forms.Button)
$Button22 = (New-Object -TypeName System.Windows.Forms.Button)
$Panel3 = (New-Object -TypeName System.Windows.Forms.Panel)
$Label3 = (New-Object -TypeName System.Windows.Forms.Label)
$Button11 = (New-Object -TypeName System.Windows.Forms.Button)
$Button12 = (New-Object -TypeName System.Windows.Forms.Button)
$Button13 = (New-Object -TypeName System.Windows.Forms.Button)
$Button14 = (New-Object -TypeName System.Windows.Forms.Button)
$Button15 = (New-Object -TypeName System.Windows.Forms.Button)
$Panel4 = (New-Object -TypeName System.Windows.Forms.Panel)
$Label4 = (New-Object -TypeName System.Windows.Forms.Label)
$Button16 = (New-Object -TypeName System.Windows.Forms.Button)
$Button17 = (New-Object -TypeName System.Windows.Forms.Button)
$Button18 = (New-Object -TypeName System.Windows.Forms.Button)
$Button19 = (New-Object -TypeName System.Windows.Forms.Button)
$Button20 = (New-Object -TypeName System.Windows.Forms.Button)
$Button23 = (New-Object -TypeName System.Windows.Forms.Button)
$ToolTip1 = (New-Object -TypeName System.Windows.Forms.ToolTip -ArgumentList @($components))
$Button21 = (New-Object -TypeName System.Windows.Forms.Button)
$Button36 = (New-Object -TypeName System.Windows.Forms.Button)
$Button25 = (New-Object -TypeName System.Windows.Forms.Button)
$Button27 = (New-Object -TypeName System.Windows.Forms.Button)
([System.ComponentModel.ISupportInitialize]$PictureBox1).BeginInit()
$Panel1.SuspendLayout()
$Panel2.SuspendLayout()
$Panel3.SuspendLayout()
$Panel4.SuspendLayout()
$Form1.SuspendLayout()
#
#PictureBox1
#
$PictureBox1.BackgroundImage = ([System.Drawing.Image]$resources.'PictureBox1.BackgroundImage')
$PictureBox1.BackgroundImageLayout = [System.Windows.Forms.ImageLayout]::Zoom
$PictureBox1.Dock = [System.Windows.Forms.DockStyle]::Top
$PictureBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$PictureBox1.Name = [System.String]'PictureBox1'
$PictureBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]982,[System.Int32]84))
$PictureBox1.TabIndex = [System.Int32]6
$PictureBox1.TabStop = $false
#
#Panel1
#
$Panel1.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$Panel1.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$Panel1.Controls.Add($Button1)
$Panel1.Controls.Add($Label2)
$Panel1.Controls.Add($Button2)
$Panel1.Controls.Add($Button3)
$Panel1.Controls.Add($Button4)
$Panel1.Controls.Add($Button5)
$Panel1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]19,[System.Int32]141))
$Panel1.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]10))
$Panel1.Name = [System.String]'Panel1'
$Panel1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]221,[System.Int32]311))
$Panel1.TabIndex = [System.Int32]7
#
#Button1
#
$Button1.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]43))
$Button1.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button1.Name = [System.String]'Button1'
$Button1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button1.TabIndex = [System.Int32]0
$Button1.Text = [System.String]'Disk Cleanup'
$Button1.UseVisualStyleBackColor = $true
$Button1.add_Click($Button1_Click)
#
#Label2
#
$Label2.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Label2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]12))
$Label2.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Label2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]-1,[System.Int32]0))
$Label2.Name = [System.String]'Label2'
$Label2.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Label2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]221,[System.Int32]33))
$Label2.TabIndex = [System.Int32]6
$Label2.Text = [System.String]'Debloat'
$Label2.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#Button2
#
$Button2.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button2.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button2.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]96))
$Button2.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button2.Name = [System.String]'Button2'
$Button2.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button2.TabIndex = [System.Int32]0
$Button2.Text = [System.String]'Remove Temp Files'
$Button2.UseVisualStyleBackColor = $true
$Button2.add_Click($Button2_Click)
#
#Button3
#
$Button3.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button3.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button3.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button3.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]149))
$Button3.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button3.Name = [System.String]'Button3'
$Button3.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button3.TabIndex = [System.Int32]0
$Button3.Text = [System.String]'Uninstall Bloatware'
$Button3.UseVisualStyleBackColor = $true
$Button3.add_Click($Button3_Click)
#
#Button4
#
$Button4.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button4.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button4.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button4.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]202))
$Button4.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button4.Name = [System.String]'Button4'
$Button4.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button4.TabIndex = [System.Int32]0
$Button4.Text = [System.String]'Disable Services'
$Button4.UseVisualStyleBackColor = $true
$Button4.add_Click($Button4_Click)
#
#Button5
#
$Button5.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button5.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button5.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button5.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button5.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]255))
$Button5.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button5.Name = [System.String]'Button5'
$Button5.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button5.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button5.TabIndex = [System.Int32]0
$Button5.Text = [System.String]'Uninstall OneDrive'
$Button5.UseVisualStyleBackColor = $true
$Button5.add_Click($Button5_Click)
#
#Label1
#
$Label1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$Label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]-1,[System.Int32]0))
$Label1.Name = [System.String]'Label1'
$Label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]221,[System.Int32]33))
$Label1.TabIndex = [System.Int32]6
$Label1.Text = [System.String]'Privacy'
$Label1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#TextBox1
#
$TextBox1.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right)
$TextBox1.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$TextBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]19,[System.Int32]464))
$TextBox1.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]10,[System.Int32]5,[System.Int32]10,[System.Int32]3))
$TextBox1.Multiline = $true
$TextBox1.Name = [System.String]'TextBox1'
$TextBox1.ReadOnly = $true
$TextBox1.ScrollBars = [System.Windows.Forms.ScrollBars]::Vertical
$TextBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]944,[System.Int32]83))
$TextBox1.TabIndex = [System.Int32]8
$TextBox1.add_TextChanged($TextBox1_TextChanged)
#
#ProgressBar1
#
$ProgressBar1.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right)
$ProgressBar1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]19,[System.Int32]553))
$ProgressBar1.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]10,[System.Int32]3,[System.Int32]10,[System.Int32]5))
$ProgressBar1.Name = [System.String]'ProgressBar1'
$ProgressBar1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]944,[System.Int32]21))
$ProgressBar1.Step = [System.Int32]5
$ProgressBar1.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$ProgressBar1.TabIndex = [System.Int32]9
#
#Panel2
#
$Panel2.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$Panel2.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Panel2.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$Panel2.Controls.Add($Label1)
$Panel2.Controls.Add($Button6)
$Panel2.Controls.Add($Button7)
$Panel2.Controls.Add($Button8)
$Panel2.Controls.Add($Button9)
$Panel2.Controls.Add($Button10)
$Panel2.Controls.Add($Button22)
$Panel2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Panel2.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Panel2.ImeMode = [System.Windows.Forms.ImeMode]::NoControl
$Panel2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]260,[System.Int32]141))
$Panel2.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]10))
$Panel2.Name = [System.String]'Panel2'
$Panel2.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Panel2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]221,[System.Int32]311))
$Panel2.TabIndex = [System.Int32]7
#
#Button6
#
$Button6.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button6.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button6.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button6.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button6.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]43))
$Button6.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button6.Name = [System.String]'Button6'
$Button6.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button6.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button6.TabIndex = [System.Int32]0
$Button6.Text = [System.String]'Disable Telemetry'
$Button6.UseVisualStyleBackColor = $true
$Button6.add_Click($Button6_Click)
#
#Button7
#
$Button7.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button7.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button7.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button7.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button7.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]96))
$Button7.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button7.Name = [System.String]'Button7'
$Button7.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button7.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button7.TabIndex = [System.Int32]0
$Button7.Text = [System.String]'Block Telemetry IPs'
$Button7.UseVisualStyleBackColor = $true
$Button7.add_Click($Button7_Click)
#
#Button8
#
$Button8.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button8.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button8.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button8.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button8.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]149))
$Button8.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button8.Name = [System.String]'Button8'
$Button8.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button8.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button8.TabIndex = [System.Int32]0
$Button8.Text = [System.String]'Run Shutup10'
$Button8.UseVisualStyleBackColor = $true
$Button8.add_Click($Button8_Click)
#
#Button9
#
$Button9.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button9.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button9.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button9.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button9.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]202))
$Button9.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button9.Name = [System.String]'Button9'
$Button9.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button9.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button9.TabIndex = [System.Int32]0
$Button9.Text = [System.String]'Placeholder'
$Button9.UseVisualStyleBackColor = $true
$Button9.add_Click($Button9_Click)
#
#Button10
#
$Button10.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button10.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button10.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button10.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button10.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]255))
$Button10.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button10.Name = [System.String]'Button10'
$Button10.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button10.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button10.TabIndex = [System.Int32]0
$Button10.Text = [System.String]'Placeholder'
$Button10.UseVisualStyleBackColor = $true
$Button10.add_Click($Button10_Click)
#
#Button22
#
$Button22.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button22.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button22.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button22.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button22.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]83,[System.Int32]-17))
$Button22.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button22.Name = [System.String]'Button22'
$Button22.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button22.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]304,[System.Int32]29))
$Button22.TabIndex = [System.Int32]0
$Button22.Text = [System.String]'Placeholder'
$Button22.UseVisualStyleBackColor = $true
#
#Panel3
#
$Panel3.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$Panel3.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Panel3.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$Panel3.Controls.Add($Label3)
$Panel3.Controls.Add($Button11)
$Panel3.Controls.Add($Button12)
$Panel3.Controls.Add($Button13)
$Panel3.Controls.Add($Button14)
$Panel3.Controls.Add($Button15)
$Panel3.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Panel3.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Panel3.ImeMode = [System.Windows.Forms.ImeMode]::NoControl
$Panel3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]501,[System.Int32]141))
$Panel3.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]10))
$Panel3.Name = [System.String]'Panel3'
$Panel3.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Panel3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]221,[System.Int32]311))
$Panel3.TabIndex = [System.Int32]7
#
#Label3
#
$Label3.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Label3.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]12))
$Label3.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Label3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]-1,[System.Int32]0))
$Label3.Name = [System.String]'Label3'
$Label3.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Label3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]221,[System.Int32]33))
$Label3.TabIndex = [System.Int32]6
$Label3.Text = [System.String]'Design'
$Label3.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#Button11
#
$Button11.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button11.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button11.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button11.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button11.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]43))
$Button11.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button11.Name = [System.String]'Button11'
$Button11.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button11.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button11.TabIndex = [System.Int32]0
$Button11.Text = [System.String]'Restore Windows 10 Context menu'
$Button11.UseVisualStyleBackColor = $true
$Button11.add_Click($Button11_Click)
#
#Button12
#
$Button12.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button12.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button12.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button12.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button12.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]96))
$Button12.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button12.Name = [System.String]'Button12'
$Button12.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button12.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button12.TabIndex = [System.Int32]0
$Button12.Text = [System.String]'Restore Explorer Compact View'
$Button12.UseVisualStyleBackColor = $true
$Button12.add_Click($Button12_Click)
#
#Button13
#
$Button13.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button13.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button13.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button13.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button13.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]149))
$Button13.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button13.Name = [System.String]'Button13'
$Button13.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button13.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button13.TabIndex = [System.Int32]0
$Button13.Text = [System.String]'Start-Menu Position Left'
$Button13.UseVisualStyleBackColor = $true
$Button13.add_Click($Button13_Click)
#
#Button14
#
$Button14.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button14.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button14.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button14.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button14.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]202))
$Button14.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button14.Name = [System.String]'Button14'
$Button14.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button14.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button14.TabIndex = [System.Int32]0
$Button14.Text = [System.String]'New Boot Animation'
$Button14.UseVisualStyleBackColor = $true
$Button14.add_Click($Button14_Click)
#
#Button15
#
$Button15.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button15.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button15.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button15.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button15.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]255))
$Button15.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button15.Name = [System.String]'Button15'
$Button15.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button15.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button15.TabIndex = [System.Int32]0
$Button15.Text = [System.String]'Enable Dark Theme'
$Button15.UseVisualStyleBackColor = $true
$Button15.add_Click($Button15_Click)
#
#Panel4
#
$Panel4.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$Panel4.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Panel4.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$Panel4.Controls.Add($Label4)
$Panel4.Controls.Add($Button16)
$Panel4.Controls.Add($Button17)
$Panel4.Controls.Add($Button18)
$Panel4.Controls.Add($Button19)
$Panel4.Controls.Add($Button20)
$Panel4.Controls.Add($Button23)
$Panel4.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Panel4.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Panel4.ImeMode = [System.Windows.Forms.ImeMode]::NoControl
$Panel4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]742,[System.Int32]141))
$Panel4.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]10))
$Panel4.Name = [System.String]'Panel4'
$Panel4.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Panel4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]221,[System.Int32]311))
$Panel4.TabIndex = [System.Int32]7
#
#Label4
#
$Label4.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Label4.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]12))
$Label4.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Label4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]-1,[System.Int32]0))
$Label4.Name = [System.String]'Label4'
$Label4.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Label4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]221,[System.Int32]33))
$Label4.TabIndex = [System.Int32]6
$Label4.Text = [System.String]'Usability'
$Label4.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#Button16
#
$Button16.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button16.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button16.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button16.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button16.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]43))
$Button16.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button16.Name = [System.String]'Button16'
$Button16.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button16.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button16.TabIndex = [System.Int32]0
$Button16.Text = [System.String]'Windows Terminal as Default'
$Button16.UseVisualStyleBackColor = $true
$Button16.add_Click($Button16_Click)
#
#Button17
#
$Button17.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button17.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button17.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button17.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button17.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]96))
$Button17.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button17.Name = [System.String]'Button17'
$Button17.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button17.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button17.TabIndex = [System.Int32]0
$Button17.Text = [System.String]'Cleanup Taskbar'
$Button17.UseVisualStyleBackColor = $true
$Button17.add_Click($Button17_Click)
#
#Button18
#
$Button18.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button18.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button18.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button18.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button18.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]149))
$Button18.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button18.Name = [System.String]'Button18'
$Button18.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button18.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button18.TabIndex = [System.Int32]0
$Button18.Text = [System.String]'Show File Extensions'
$Button18.UseVisualStyleBackColor = $true
$Button18.add_Click($Button18_Click)
#
#Button19
#
$Button19.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button19.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button19.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button19.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button19.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]202))
$Button19.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button19.Name = [System.String]'Button19'
$Button19.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button19.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button19.TabIndex = [System.Int32]0
$Button19.Text = [System.String]'Explorer Default-View "This PC"'
$Button19.UseVisualStyleBackColor = $true
$Button19.add_Click($Button19_Click)
#
#Button20
#
$Button20.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button20.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button20.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button20.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button20.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]255))
$Button20.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button20.Name = [System.String]'Button20'
$Button20.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button20.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]189,[System.Int32]40))
$Button20.TabIndex = [System.Int32]0
$Button20.Text = [System.String]'Placeholder'
$Button20.UseVisualStyleBackColor = $true
$Button20.add_Click($Button20_Click)
#
#Button23
#
$Button23.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button23.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button23.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button23.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button23.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]-75,[System.Int32]-1))
$Button23.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button23.Name = [System.String]'Button23'
$Button23.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button23.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]290,[System.Int32]29))
$Button23.TabIndex = [System.Int32]0
$Button23.Text = [System.String]'Placeholder'
$Button23.UseVisualStyleBackColor = $true
#
#ToolTip1
#
$ToolTip1.AutoPopDelay = [System.Int32]5000
$ToolTip1.InitialDelay = [System.Int32]200
$ToolTip1.ReshowDelay = [System.Int32]200
$ToolTip1.ToolTipTitle = [System.String]'Info'
$ToolTip1.add_Popup($ToolTip1_Popup)
#
#Button21
#
$Button21.BackColor = [System.Drawing.SystemColors]::ControlLight
$Button21.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button21.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button21.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button21.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]19,[System.Int32]99))
$Button21.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button21.Name = [System.String]'Button21'
$Button21.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button21.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]221,[System.Int32]29))
$Button21.TabIndex = [System.Int32]0
$Button21.Text = [System.String]'Create Restore Point'
$Button21.UseVisualStyleBackColor = $true
$Button21.add_Click($Button21_Click)
#
#Button36
#
$Button36.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button36.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button36.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button36.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button36.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]501,[System.Int32]99))
$Button36.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button36.Name = [System.String]'Button36'
$Button36.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button36.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]221,[System.Int32]29))
$Button36.TabIndex = [System.Int32]0
$Button36.Text = [System.String]'Restart PC'
$Button36.UseVisualStyleBackColor = $true
$Button36.add_Click($Button36_Click)
#
#Button25
#
$Button25.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button25.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button25.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button25.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button25.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]260,[System.Int32]99))
$Button25.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button25.Name = [System.String]'Button25'
$Button25.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button25.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]221,[System.Int32]29))
$Button25.TabIndex = [System.Int32]0
$Button25.Text = [System.String]'Customize Bloatware-List'
$Button25.UseVisualStyleBackColor = $true
$Button25.add_Click($Button25_Click)
#
#Button27
#
$Button27.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Button27.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$Button27.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25))
$Button27.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)),([System.Int32]([System.Byte][System.Byte]0)))

$Button27.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]742,[System.Int32]99))
$Button27.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15,[System.Int32]10,[System.Int32]15,[System.Int32]3))
$Button27.Name = [System.String]'Button27'
$Button27.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$Button27.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]221,[System.Int32]29))
$Button27.TabIndex = [System.Int32]0
$Button27.Text = [System.String]'About'
$Button27.UseVisualStyleBackColor = $true
$Button27.add_Click($Button27_Click)
#
#Form1
#
$Form1.AutoScaleDimensions = (New-Object -TypeName System.Drawing.SizeF -ArgumentList @([System.Single]96,[System.Single]96))
$Form1.AutoScaleMode = [System.Windows.Forms.AutoScaleMode]::Dpi
$Form1.AutoSize = $true
$Form1.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$Form1.BackColor = [System.Drawing.SystemColors]::ControlLightLight
$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]982,[System.Int32]588))
$Form1.Controls.Add($ProgressBar1)
$Form1.Controls.Add($TextBox1)
$Form1.Controls.Add($Panel1)
$Form1.Controls.Add($PictureBox1)
$Form1.Controls.Add($Panel2)
$Form1.Controls.Add($Panel3)
$Form1.Controls.Add($Panel4)
$Form1.Controls.Add($Button21)
$Form1.Controls.Add($Button36)
$Form1.Controls.Add($Button25)
$Form1.Controls.Add($Button27)
$Form1.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$Form1.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$Form1.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$Form1.Text = [System.String]'setupWin11'
$Form1.add_Load($Form1_Load)
([System.ComponentModel.ISupportInitialize]$PictureBox1).EndInit()
$Panel1.ResumeLayout($false)
$Panel2.ResumeLayout($false)
$Panel3.ResumeLayout($false)
$Panel4.ResumeLayout($false)
$Form1.ResumeLayout($false)
$Form1.PerformLayout()
Add-Member -InputObject $Form1 -Name PictureBox1 -Value $PictureBox1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Panel1 -Value $Panel1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button1 -Value $Button1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Label2 -Value $Label2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button2 -Value $Button2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button3 -Value $Button3 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button4 -Value $Button4 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button5 -Value $Button5 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Label1 -Value $Label1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TextBox1 -Value $TextBox1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ProgressBar1 -Value $ProgressBar1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Panel2 -Value $Panel2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button6 -Value $Button6 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button7 -Value $Button7 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button8 -Value $Button8 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button9 -Value $Button9 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button10 -Value $Button10 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button22 -Value $Button22 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Panel3 -Value $Panel3 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Label3 -Value $Label3 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button11 -Value $Button11 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button12 -Value $Button12 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button13 -Value $Button13 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button14 -Value $Button14 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button15 -Value $Button15 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Panel4 -Value $Panel4 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Label4 -Value $Label4 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button16 -Value $Button16 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button17 -Value $Button17 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button18 -Value $Button18 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button19 -Value $Button19 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button20 -Value $Button20 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button23 -Value $Button23 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ToolTip1 -Value $ToolTip1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name components -Value $components -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button21 -Value $Button21 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button36 -Value $Button36 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button25 -Value $Button25 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button27 -Value $Button27 -MemberType NoteProperty
}
. InitializeComponent
$Form1.ShowDialog()