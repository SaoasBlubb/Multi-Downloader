@echo off

mkdir YouTube_Spotify_Downloader
cd YouTube_Spotify_Downloader

powershell Get-AppxPackage microsoft.desktopappinstaller 
setx PATH "%userprofile%\AppData\Local\Microsoft\WindowsApps;%PATH%" 

cmd /c winget install Chocolatey.Chocolatey 
cmd /c choco install curl -y 
cmd /c choco install wget -y 
cmd /c choco install git -y 

setx PATH "C:\Program Files\Git\cmd;%PATH%" 2>&1>nul

cmd /c wget --limit-rate=50M https://www.python.org/ftp/python/3.11.5/python-3.11.5-amd64.exe
cmd /c python-3.11.5-amd64.exe /quiet InstallAllUsers=1 PrependPath=1
setx PATH "%userprofile%\AppData\Local\Programs\Python\Python311;%PATH%" 2>&1>nul
setx PATH "C:\Program Files\Python311\Scripts;%PATH%" 2>&1>nul

cmd /c curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
cmd /c py get-pip.py
cmd /c python.exe -m pip install --upgrade pip

REM cmd /c git clone https://github.com/spotDL/spotify-downloader && cd spotify-downloader
REM cmd /c pip install poetry
REM cmd /c poetry install
REM cmd /c poetry run python scripts/build.py
REM cd dist
cmd /c wget --limit-rate=50M https://github.com/spotDL/spotify-downloader/releases/latest/download/spotdl-4.2.1-win32.exe -O spotdl.exe
REM ren * spotdl.exe
REM call xcopy * ..\.. /s /e /Y
REM cd ..\..
REM rmdir spotify-downloader /S /Q 
REM del get-pip.py python-3.11.5-amd64.exe

cmd /c wget --limit-rate=50M https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -O yt-dlp.exe

cmd /c wget --limit-rate=50M https://github.com/BtbN/FFmpeg-Builds/releases/latest/download/ffmpeg-master-latest-win64-gpl.zip
tar -xf ffmpeg-master-latest-win64-gpl.zip
cd ffmpeg-master-latest-win64-gpl/bin
call xcopy * ..\.. /s /e /Y
cd ..\..
rmdir ffmpeg-master-latest-win64-gpl /S /Q
del ffmpeg-master-latest-win64-gpl.zip

cmd /c wget --limit-rate=50M https://github.com/SaoasBlubb/Multi-Downloader/releases/download/v2.0.0/YouTube_Spotify_Downloader.exe
cmd /c wget --limit-rate=50M https://github.com/SaoasBlubb/Multi-Downloader/releases/download/v2.0.0/setup.exe
cmd /c wget --limit-rate=50M https://github.com/SaoasBlubb/Multi-Downloader/releases/download/v2.0.0/update.exe

start setup.exe 2>&1>nul
exit
