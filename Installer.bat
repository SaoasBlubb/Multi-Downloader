@echo off
powershell.exe Invoke-WebRequest -Uri "https://eternallybored.org/misc/wget/1.21.4/64/wget.exe" -OutFile "wget.exe"
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/setup.exe -O setup.exe
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/update.exe -O update.exe
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/YouTube_Spotify_Downloader.exe -O YouTube_Spotify_Downloader.exe
mkdir lib
del /S /q wget.exe
cd lib
powershell.exe Invoke-WebRequest -Uri "https://eternallybored.org/misc/wget/1.21.4/64/wget.exe" -OutFile "wget.exe"
wget -F -q --no-hsts https://www.python.org/ftp/python/3.11.0/python-3.11.0-amd64.exe -O python-3.11.0-amd64.exe
python-3.11.0-amd64.exe /quiet PrependPath=1 Include_test=0
call cmd.exe /C pip install --upgrade pip
call cmd.exe /C pip install spotdl
call cmd.exe /C pip install --upgrade spotdl
call cmd.exe /C pip install yt-dlp
wget -F -q --no-hsts https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -O ffmpeg-master-latest-win64-gpl.zip
tar -xf ffmpeg-master-latest-win64-gpl.zip
del /S /q ffmpeg-master-latest-win64-gpl.zip
del /S /q python-3.11.0-amd64.exe
cd ffmpeg-master-latest-win64-gpl\bin
xcopy * ..\.. /s /e /Y
cd ..\..
rd /S /q ffmpeg-master-latest-win64-gpl
mkdir C:\Saoas
move * C:\Saoas
cd ..
rd /S /q lib
REM spotdl --download-ffmpeg --force
setup.exe
exit