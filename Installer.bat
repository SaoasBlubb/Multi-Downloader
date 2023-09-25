@echo off
powershell curl https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O wget.exe
mkdir lib
cd lib
powershell curl https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O wget.exe
wget -F -q --no-hsts https://github.com/spotDL/spotify-downloader/releases/latest/download/spotdl-4.2.1-win32.exe -O spotdl.exe
wget -F -q --no-hsts https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -O yt-dlp.exe
wget -F -q --no-hsts https://github.com/BtbN/FFmpeg-Builds/releases/latest/download/ffmpeg-master-latest-win64-gpl.zip -O ffmpeg-master-latest-win64-gpl.zip
tar -xf ffmpeg-master-latest-win64-gpl.zip
del ffmpeg-master-latest-win64-gpl.zip
cd ffmpeg-master-latest-win64-gpl/bin
call xcopy * ..\.. /s /e /Y
cd ..\..
rmdir /s /q ffmpeg-master-latest-win64-gpl
cd ..
setup.exe
exit