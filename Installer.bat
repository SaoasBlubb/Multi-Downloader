@echo off
powershell wget https://github.com/SaoasBlubb/Multi-Downloader/releases/download/v1.0.0/YouTube_Spotify_Downloader.zip -O YouTube_Spotify_Downloader.zip 2>&1>nul
tar -xf YouTube_Spotify_Downloader.zip 2>&1>nul
del YouTube_Spotify_Downloader.zip 2>&1>nul
cd YouTube_Spotify_Downloader 2>&1>nul
start setup.exe 2>&1>nul
exit