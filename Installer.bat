@echo off
wget -F -q https://github.com/SaoasBlubb/Multi-Downloader/releases/download/v2.0.0/YouTube_Spotify_Downloader.zip -O YouTube_Spotify_Downloader.zip 2>&1>nul
tar -xf YouTube_Spotify_Downloader.zip 2>&1>nul
del YouTube_Spotify_Downloader.zip 2>&1>nul
cd YouTube_Spotify_Downloader 2>&1>nul
mkdir libs 2>&1>nul
cd libs 2>&1>nul
git clone https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe 2>&1>nul

start setup.exe 2>&1>nul
exit
