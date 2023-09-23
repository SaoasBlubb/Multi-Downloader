@echo off
mkdir "C:\Saoas" 2>&1>nul
copy "*.exe" "C:\Saoas" 2>&1>nul
cd "C:\Saoas" 2>&1>nul
setx PATH "C:\Saoas;%PATH%" 2>&1>nul

wget --limit-rate=50M https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/YouTube_Spotify_Downloader.exe
wget --limit-rate=50M https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/update.exe
wget --limit-rate=50M  https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/setup.exe

REM start %~dp0\YouTube_Spotify_Downloader.exe 
exit
