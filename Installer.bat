@echo off

winget install -e --id Python.Python.3.11
winget install -e --id Git.Git
winget install -e --id JernejSimoncic.Wget
winget install -e --id cURL.cURL
winget install yt-dlp


start setup.exe 2>&1>nul
exit
