@echo off
powershell curl https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -o wget.exe
REM wget --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/download/v2.0.0/Installer.exe
REM Installer.exe
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/setup.exe
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/update.exe
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/YouTube_Spotify_Downloader.exe
mkdir lib
cd lib
powershell curl https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -o wget.exe
wget -F -q --no-hsts https://github.com/spotDL/spotify-downloader/releases/latest/download/spotdl-4.2.1-win32.exe -O spotdl.exe
wget -F -q --no-hsts https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -O yt-dlp.exe
wget -F -q --no-hsts https://github.com/BtbN/FFmpeg-Builds/releases/latest/download/ffmpeg-master-latest-win64-gpl.zip -O ffmpeg.zip
tar -xf ffmpeg.zip
del ffmpeg.zip
cd ffmpeg-master-latest-win64-gpl/bin
call xcopy * ..\.. /s /e /Y
cd ..\..
rmdir /s /q ffmpeg-master-latest-win64-gpl
mkdir C:\Saoas
copy * C:\Saoas
cd ..
start setup.exe
exit