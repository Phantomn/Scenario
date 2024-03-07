mkdir C:\setup
copy e:\Unattended\* C:\setup\
Start-Process -FilePath "C:\setup\ChromeStandaloneSetup64.exe" -ArgumentList "/silent /install" -Wait

cmd.exe /c shutdown -s -t 0