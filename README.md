# Multi Downloader
- A Downloader Tool for Downloading Songs, Videos, Playlists from Spotify, YouTube, Soundcloud, Twitch and any other Website!

## Requirements
__1. Manually Method:__
   - Install chocolatey with pasting following code in your cmd.exe:
     - ```
       @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
       ```
   - Install wget with cmd command:
     - ```
       powershell Invoke-WebRequest -Uri "https://eternallybored.org/misc/wget/1.21.4/64/wget.exe" -OutFile "wget.exe" 
       ```
   - Download Compiled files:
     - ```
       wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/fansly.exe -O fansly.exe
       wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/config.ini -O config.ini
       wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/Multi_Downloader.exe -O Multi_Downloader.exe
       ```
   - Install Python 3.10 with this cmd command:
     - ````
       choco install python311 -y
       ````
   - Then install:
     - ```
       pip install --upgrade pip
       pip install yt-dlp -y
       pip install spotdl -y
       ```
   - Now Download FFmpeg:
     - ```
       wget -F -q --no-hsts https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -O ffmpeg-master-latest-win64-gpl.zip
       tar -xf ffmpeg-master-latest-win64-gpl.zip
       del /S /q ffmpeg-master-latest-win64-gpl.zip
       cd ffmpeg-master-latest-win64-gpl\bin
       xcopy * ..\.. /s /e /Y
       cd ..\.. 
       rd /S /q ffmpeg-master-latest-win64-gpl
       cd .. 
       ```
   - Finally Set the Variable PATHs:
     - ```
       mkdir "C:\Saoas" 
       copy "lib\*.exe" "C:\Saoas" 
       rd /S /q lib 
       cd "C:\Saoas" 
       setx PATH "C:\Saoas;%PATH%" 
       ```

__2. Auto Method:__ 
  > *Anti Virus maybe says Positive cuz it downloads and Installs into System Path, like the Manual Method*
   - Just Download and Execute Installer!
     - [Installer](https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/Installer.exe)

### In Action
- __Main Menu and Update!__

  ![Main Menu](https://github.com/SaoasBlubb/Multi-Downloader/assets/56938581/63e35edc-7dd1-44b9-97ea-9ec98451aabd)

  ![Update](https://github.com/SaoasBlubb/Multi-Downloader/assets/56938581/97908d06-1b9f-4309-8361-bd65e5e7bfba)
#
- __YouTube Menu!__

  ![YouTube Main](https://github.com/SaoasBlubb/Multi-Downloader/assets/56938581/87c3e22d-bad9-4201-a6b5-b161b10ea79a)

  ![YouTube Audio Menu](https://github.com/SaoasBlubb/Multi-Downloader/assets/56938581/8d81457f-7560-4195-8f4a-3529438a5b21)

  ![YouTube Video Menu](https://github.com/SaoasBlubb/Multi-Downloader/assets/56938581/426c9fa3-a8eb-4968-a1af-2463ec0f431b)
  - __YouTube Download!__
  
  ![YouTube Audio Playlist Download](https://github.com/SaoasBlubb/Multi-Downloader/assets/56938581/b8835d8c-d5fd-408f-a739-a05f8a6040a9)
#
- __Spotify Menu!__

  ![Spotify Main](https://github.com/SaoasBlubb/Multi-Downloader/assets/56938581/f21b3341-45b8-4ec6-a493-345bd34ff7e8)
  - __Spotify Download!__
  
  ![Spotify Artist Download](https://github.com/SaoasBlubb/Multi-Downloader/assets/56938581/25e20721-9cc0-4ec9-8af3-f9d5fdcfff8d)
#
- __SoundCloud Menu!__

  ![SoundCloud Main](https://github.com/SaoasBlubb/Multi-Downloader/assets/56938581/3b6abaf8-d4ff-4bcb-ace5-0b159b052fa6)
  - __SoundCloud Download!__
 
  ![SoundCloud Playlist Download](https://github.com/SaoasBlubb/Multi-Downloader/assets/56938581/81e4a2bf-0885-4de6-9fe5-07c5bdc00dd9)
#
- __Website Menu!__

  ![Website Main](https://github.com/SaoasBlubb/Multi-Downloader/assets/56938581/a80ea59c-b0b1-4a5a-9bf1-cc0822fe79ec)
  - __Fansly Download!__
  
  ![Fansly](https://github.com/SaoasBlubb/Multi-Downloader/assets/56938581/ee609123-fefb-49c1-8c4d-fc07cbbf1bb2)
