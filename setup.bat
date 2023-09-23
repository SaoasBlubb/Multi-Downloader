@echo off
mkdir "C:\Saoas" 2>&1>nul
copy "lib\*.exe" "C:\Saoas" 2>&1>nul
cd "C:\Saoas" 2>&1>nul
setx PATH "C:\Saoas;%PATH%" 2>&1>nul
REM start %~dp0\YouTube_Spotify_Downloader.exe 
exit
