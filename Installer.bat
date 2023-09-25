@echo off
powershell curl https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -o wget.exe
powershell curl https://github.com/SaoasBlubb/Multi-Downloader/releases/download/v2.0.0/Installer.exe -o Installer.exe

wget -F -q https://github.com/SaoasBlubb/Multi-Downloader/releases/download/v2.0.0/YouTube_Spotify_Downloader.zip -O YouTube_Spotify_Downloader.zip
tar -xf YouTube_Spotify_Downloader.zip
del YouTube_Spotify_Downloader.zip
cd YouTube_Spotify_Downloader/lib
wget -F -q https://github.com/spotDL/spotify-downloader/releases/latest/download/spotdl-4.2.1-win32.exe -O spotdl.exe
wget -F -q https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -O yt-dlp.exe
wget -F -q https://github.com/BtbN/FFmpeg-Builds/releases/latest/download/ffmpeg-master-latest-win64-gpl.zip
tar -xf ffmpeg-master-latest-win64-gpl.zip
cd ffmpeg-master-latest-win64-gpl/bin
call xcopy * ..\.. /s /e /Y
cd ..\..
rmdir /s /q ffmpeg-master-latest-win64-gpl
del ffmpeg-master-latest-win64-gpl.zip
copy * C:\Saoas
cd ..
start setup.exe
exit