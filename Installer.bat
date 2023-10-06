@echo off
powershell curl https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O wget.exe 2>&1>nul
mkdir lib 2>&1>nul
cd lib 2>&1>nul
powershell curl https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O wget.exe 2>&1>nul
wget -F -q --no-hsts https://github.com/spotDL/spotify-downloader/releases/latest/download/spotdl-4.2.1-win32.exe -O spotdl.exe 2>&1>nul
wget -F -q --no-hsts https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -O yt-dlp.exe 2>&1>nul
wget -F -q --no-hsts https://github.com/BtbN/FFmpeg-Builds/releases/latest/download/ffmpeg-master-latest-win64-gpl.zip -O ffmpeg-master-latest-win64-gpl.zip 2>&1>nul
tar -xf ffmpeg-master-latest-win64-gpl.zip 2>&1>nul
del ffmpeg-master-latest-win64-gpl.zip 2>&1>nul
cd ffmpeg-master-latest-win64-gpl/bin 2>&1>nul
call xcopy * ..\.. /s /e /Y 2>&1>nul
cd ..\.. 2>&1>nul
rmdir /s /q ffmpeg-master-latest-win64-gpl 2>&1>nul
cd .. 2>&1>nul
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/setup.exe -O setup.exe 2>&1>nul
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/update.exe -O update.exe 2>&1>nul
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/YouTube_Spotify_Downloader.exe -O YouTube_Spotify_Downloader.exe 2>&1>nul
setup.exe 2>&1>nul
exit
