@echo off

title Installing Chocolatey!...

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"


title Downloading Files!...

powershell Invoke-WebRequest -Uri "https://eternallybored.org/misc/wget/1.21.4/64/wget.exe" -OutFile "wget.exe" 
REM START /B /wait wget.exe -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/setup.exe -O setup.exe
REM wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/update.exe -O update.exe 2>&1>nul
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/fansly.exe -O fansly.exe
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/config.ini -O config.ini
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/Multi_Downloader.exe -O Multi_Downloader.exe

mkdir lib
move wget.exe lib
cd lib


title Installing Python!...

wget -F -q --no-hsts https://github.com/spotDL/spotify-downloader/releases/download/v4.2.1/spotdl-4.2.1-win32.exe -O spotdl.exe
choco install yt-dlp -y
choco install python311 -y
pip install --upgrade pip

title Installing needed Tools!...


wget -F -q --no-hsts https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -O ffmpeg-master-latest-win64-gpl.zip
tar -xf ffmpeg-master-latest-win64-gpl.zip
del /S /q ffmpeg-master-latest-win64-gpl.zip
cd ffmpeg-master-latest-win64-gpl\bin
xcopy * ..\.. /s /e /Y
cd ..\.. 
rd /S /q ffmpeg-master-latest-win64-gpl
cd .. 


title Setting Up Variable Paths...

mkdir "C:\Saoas" 
copy "lib\*.exe" "C:\Saoas" 
rd /S /q lib 
cd "C:\Saoas" 
setx PATH "C:\Saoas;%PATH%" 
start %~dp0\Multi_Downloader.exe 
exit
