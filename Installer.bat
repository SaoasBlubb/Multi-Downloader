@echo off
wget -F -q https://github.com/SaoasBlubb/Multi-Downloader/releases/download/v2.0.0/YouTube_Spotify_Downloader.zip -O YouTube_Spotify_Downloader.zip 2>&1>nul
tar -xf YouTube_Spotify_Downloader.zip 2>&1>nul
del YouTube_Spotify_Downloader.zip 2>&1>nul
cd YouTube_Spotify_Downloader/lib 2>&1>nul
wget -F -q https://github.com/spotDL/spotify-downloader/releases/latest/download/spotdl-4.2.1-win32.exe -O spotdl.exe
wget -F -q https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -O yt-dlp.exe
wget -F -q https://github.com/BtbN/FFmpeg-Builds/releases/latest/download/ffmpeg-master-latest-win64-gpl.zip
tar -xf ffmpeg-master-latest-win64-gpl.zip
cd ffmpeg-master-latest-win64-gpl/bin
call xcopy * ..\.. /s /e /Y
rmdir ffmpeg-master-latest-win64-gpl /S /Q
del ffmpeg-master-latest-win64-gpl.zip
start setup.exe 2>&1>nul
exit