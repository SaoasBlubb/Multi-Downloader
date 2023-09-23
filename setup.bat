@echo off
mkdir "C:\Saoas"
copy "lib\*.exe" "C:\Saoas"
cd "C:\Saoas"
setx PATH "C:\Saoas;%PATH%"
REM start %~dp0\YouTube_Spotify_Downloader.exe 
exit
