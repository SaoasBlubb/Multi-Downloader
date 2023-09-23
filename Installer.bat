@echo off

mkdir libs
cd libs
winget install -e --id Python.Python.3.11
winget install -e --id Git.Git
winget install -e --id JernejSimoncic.Wget
winget install -e --id cURL.cURL
winget install yt-dlp
winget install -e --id Gyan.FFmpeg
pip install spotdl
cd ..
start setup.exe 2>&1>nul
exit
