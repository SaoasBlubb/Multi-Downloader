@echo off
title Installing Multi-Downloader...
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco install wget --force -y
wget -F -q --no-hsts https://www.python.org/ftp/python/3.11.0/python-3.11.0-amd64.exe
python-3.11.0-amd64.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
REM choco install git --force -y
REM choco install jq --force -y
choco install curl --force -y
choco install ffmpeg --force -y
choco install yt-dlp --force -y
cmd.exe /C pip install --upgrade pip
cmd.exe /C pip install spotdl
cmd.exe /C pip install --upgrade spotdl
REM git clone https://github.com/spotDL/spotify-downloader && cd spotify-downloader
REM pip install poetry
REM poetry install
REM poetry run python scripts/build.py
del python-3.11.0-amd64.exe
REM del spotify-downloader 2>&1>nul
REM powershell curl https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O wget.exe 2>&1>nul
REM mkdir lib 2>&1>nul
REM cd lib 2>&1>nul
REM powershell curl https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O wget.exe 2>&1>nul
REM wget -F -q --no-hsts https://github.com/spotDL/spotify-downloader/releases/latest/download/spotdl-4.2.1-win32.exe -O spotdl.exe 2>&1>nul
REM wget -F -q --no-hsts https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -O yt-dlp.exe 2>&1>nul
REM wget -F -q --no-hsts https://github.com/BtbN/FFmpeg-Builds/releases/latest/download/ffmpeg-master-latest-win64-gpl.zip -O ffmpeg-master-latest-win64-gpl.zip 2>&1>nul
REM tar -xf ffmpeg-master-latest-win64-gpl.zip 2>&1>nul
REM del ffmpeg-master-latest-win64-gpl.zip 2>&1>nul
REM cd ffmpeg-master-latest-win64-gpl/bin 2>&1>nul
REM call xcopy * ..\.. /s /e /Y 2>&1>nul
REM cd ..\.. 2>&1>nul
REM rmdir /s /q ffmpeg-master-latest-win64-gpl 2>&1>nul
REM cd .. 2>&1>nul
REM wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/setup.exe -O setup.exe 2>&1>nul
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/update.exe -O update.exe 2>&1>nul
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/YouTube_Spotify_Downloader.exe -O YouTube_Spotify_Downloader.exe 2>&1>nul
REM setup.exe 2>&1>nul
exit
