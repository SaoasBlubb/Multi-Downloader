@echo off

mkdir lib
cd lib
winget install -e --id Python.Python.3.11
winget install -e --id Git.Git
winget install -e --id JernejSimoncic.Wget
winget install -e --id cURL.cURL
winget install yt-dlp
winget install -e --id Gyan.FFmpeg
pip install spotdl
cd ..
wget https://raw.githubusercontent.com/SaoasBlubb/Multi-Downloader/main/YouTube_Spotify_Downloader.bat
wget https://raw.githubusercontent.com/SaoasBlubb/Multi-Downloader/main/setup.bat
wget https://raw.githubusercontent.com/SaoasBlubb/Multi-Downloader/main/update.bat
start setup.exe 2>&1>nul
exit
