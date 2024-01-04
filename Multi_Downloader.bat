@echo off

rd /S /q Update 2>&1>nul

SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)

SETLOCAL EnableDelayedExpansion

title Saoas' Multi_Downloader v5.0.0

mode con:cols=80 lines=25
set BGcol=0
rem ChangeColor 7 %BGcol%
cls
:Menu
rem Paintscreen %BGcol%
rem ChangeColor 7 %BGcol%
rem PrintBox 19 44 2
rem PrintBox 15 38 %BGcol%
rem PrintCenter Main Menu 5 2 %BGcol%
rem ChangeColor 9 0
rem Locate 9 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor YouTube 11 %BGcol%
rem Locate 11 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Spotify 11 %BGcol%
rem Locate 13 35
rem PrintColor 3)  14 %BGcol%
rem PrintColor Soundcloud 11 %BGcol%
rem Locate 15 35
rem PrintColor 4)  14 %BGcol%
rem PrintColor Website 11 %BGcol%
rem Locate 17 35
REM rem PrintColor 5)  14 %BGcol%
REM rem PrintColor Update 11 %BGcol%
rem Locate 21 38
rem PrintColor EXIT 14 0
rem ChangeColor 10 %BGcol%
rem MouseCMD 35,9,43,9 35,11,43,11 35,13,46,13 35,15,43,15 35,17,42,17 38,21,42,21
if %result%==1 goto youtube
if %result%==2 goto spotify
if %result%==3 goto soundcloud
if %result%==4 goto website
REM if %result%==5 goto update
if %result%==6 Exit
goto Menu

:update
mode con:cols=80 lines=25
rem CenterSelf
set FGcol=10
rem ChangeColor %FGcol% 0
rem PrintCenter Updating... 11 12 %BGcol%
rem PrintBoxAt 12 31 3 20 2
rem ChangeColor 0 %FGcol%

rem Wait 30
REM COPY FILES HERE

mkdir "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader/Update" 2>&1>nul
cd /d "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader/Update" 2>&1>nul
 
rem ShadeBoxAt 13 32 1 2 2
rem Wait 30
REM COPY MORE FILES HERE



rem ShadeBoxAt 13 34 1 2 2
rem Wait 30
REM COPY MORE FILES HERE

wget -q --user-agent="chrome" --no-hsts https://links.saoas.tv/Multi_Downloader/update.exe -O update.exe 2>&1>nul

rem ShadeBoxAt 13 36 1 2 2
rem Wait 30
REM COPY MORE FILES HERE



rem ShadeBoxAt 13 38 1 2 2
rem Wait 30
REM COPY MORE FILES HERE

pip install --upgrade spotdl 2>&1>nul

rem ShadeBoxAt 13 40 1 2 2
rem Wait 30
REM COPY MORE FILES HERE



rem ShadeBoxAt 13 42 1 2 2
rem Wait 30
REM COPY MORE FILES HERE

yt-dlp -q -U 2>&1>nul

rem ShadeBoxAt 13 44 1 2 2
rem Wait 30
REM COPY MORE FILES HERE


rem ShadeBoxAt 13 46 1 2 2
rem Wait 30
REM COPY MORE FILES HERE

start "" %USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader/Update/update.exe

rem ShadeBoxAt 13 48 1 2 2
rem ClearColor
rem Locate 25 1

exit


mode con:cols=80 lines=25
set BGcol=0
rem ChangeColor 7 %BGcol%
cls
:youtube
rem Paintscreen %BGcol%
rem ChangeColor 7 %BGcol%
rem PrintBox 19 44 2
rem PrintBox 15 38 %BGcol%
rem PrintCenter YouTube Downloader Menu 5 2 %BGcol%
rem ChangeColor 9 0
rem Locate 9 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor Audio 11 %BGcol%
rem Locate 11 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Video 11 %BGcol%
rem Locate 21 28
rem PrintColor BACK 12 0
rem Locate 21 38
rem PrintColor MENU 14 0
rem ChangeColor 10 %BGcol%
rem MouseCMD 35,9,41,9 35,11,41,11 28,21,33,21 38,21,42,21
if %result%==1 goto audio
if %result%==2 goto video
if %result%==3 goto Menu
if %result%==4 goto Menu
goto youtube


mode con:cols=80 lines=25
set BGcol=0
rem ChangeColor 7 %BGcol%
cls
:audio
rem Paintscreen %BGcol%
rem ChangeColor 7 %BGcol%
rem PrintBox 19 44 2
rem PrintBox 15 38 %BGcol%
rem PrintCenter YouTube Audio Download Menu 5 2 %BGcol%
rem ChangeColor 9 0
rem Locate 9 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor Single 11 %BGcol%
rem Locate 11 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Playlist 11 %BGcol%
rem Locate 21 28
rem PrintColor BACK 12 0
rem Locate 21 38
rem PrintColor MENU 14 0
rem ChangeColor 10 %BGcol%
rem MouseCMD 35,9,42,9 35,11,44,11 28,21,33,21 38,21,42,21
if %result%==1 goto single
if %result%==2 goto audioplaylist
if %result%==3 goto youtube
if %result%==4 goto Menu
goto audio


:single
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings -x --audio-format mp3 --audio-quality 320k --newline --progress --no-playlist -o "Downloads/YouTube/Audios/Singles/%%(title)s.%%(ext)s" -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:audioplaylist
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings -x --audio-format mp3 --audio-quality 320k --newline --progress --yes-playlist -o "Downloads/YouTube/Audios/Playlists/%%(playlist)s/%%(title)s.%%(ext)s" -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

mode con:cols=80 lines=25
set BGcol=0
rem ChangeColor 7 %BGcol%
cls
:video
rem Paintscreen %BGcol%
rem ChangeColor 7 %BGcol%
rem PrintBox 19 44 2
rem PrintBox 15 38 %BGcol%
rem PrintCenter YouTube Video Download Menu 5 2 %BGcol%
rem ChangeColor 9 0
rem Locate 9 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor Single 11 %BGcol%
rem Locate 11 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Playlist 11 %BGcol%
rem Locate 21 28
rem PrintColor BACK 12 0
rem Locate 21 38
rem PrintColor MENU 14 0
rem ChangeColor 10 %BGcol%
rem MouseCMD 35,9,42,9 35,11,44,11 28,21,33,21 38,21,42,21
if %result%==1 goto singlevideo
if %result%==2 goto playlistvideo
if %result%==3 goto youtube
if %result%==4 goto Menu
goto video


:playlistvideo
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings --newline --progress --yes-playlist -o "Downloads/YouTube/Videos/Playlists/%%(playlist)s/%%(title)s.%%(ext)s" -f bestvideo+bestaudio/best -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:singlevideo
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings --newline --progress -o "Downloads/YouTube/Videos/Singles/%%(title)s.%%(ext)s" -f bestvideo+bestaudio/best -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

mode con:cols=80 lines=25
set BGcol=0
rem ChangeColor 7 %BGcol%
cls
:spotify
rem Paintscreen %BGcol%
rem ChangeColor 7 %BGcol%
rem PrintBox 19 44 2
rem PrintBox 15 38 %BGcol%
rem PrintCenter Spotify Downloader Menu 5 2 %BGcol%
rem ChangeColor 9 0
rem Locate 9 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor Track 11 %BGcol%
rem Locate 11 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Playlist 11 %BGcol%
rem Locate 13 35
rem PrintColor 3)  14 %BGcol%
rem PrintColor Album 11 %BGcol%
rem Locate 15 35
rem PrintColor 4)  14 %BGcol%
rem PrintColor Artist 11 %BGcol%
rem Locate 21 28
rem PrintColor BACK 12 0
rem Locate 21 38
rem PrintColor MENU 14 0
rem ChangeColor 10 %BGcol%
rem MouseCMD 35,9,41,9 35,11,44,11 35,13,41,13 35,15,42,15 28,21,33,21 38,21,42,21
if %result%==1 goto singlespotify
if %result%==2 goto playlistspotify
if %result%==3 goto albumspotify
if %result%==4 goto artistspotify
if %result%==5 goto Menu
if %result%==6 goto Menu
goto spotify


:singlespotify
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
spotdl --bitrate 320k --output "Downloads/Spotify/Tracks/{title}.{output-ext}" download %URL%
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:playlistspotify
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
spotdl --bitrate 320k --output "Downloads/Spotify/Playlists/{list-name}/{title}.{output-ext}" download %URL%
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:albumspotify
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
spotdl --bitrate 320k --output "Downloads/Spotify/Albums/{album}/{title}.{output-ext}" download %URL%
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:artistspotify
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
spotdl --bitrate 320k --output "Downloads/Spotify/Artists/{artist}/{title}.{output-ext}" download %URL%
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

mode con:cols=80 lines=25
set BGcol=0
rem ChangeColor 7 %BGcol%
cls
:website
rem Paintscreen %BGcol%
rem ChangeColor 7 %BGcol%
rem PrintBox 19 44 2
rem PrintBox 15 38 %BGcol%
rem PrintCenter Website Downloader Menu 5 2 %BGcol%
rem ChangeColor 9 0
rem Locate 9 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor Audio 11 %BGcol%
rem Locate 11 35
rem PrintColor 2)  14 %BGcol%
rem PrintColor Video 11 %BGcol%
rem Locate 13 35 
rem PrintColor 3)  14 %BGcol%
rem PrintColor Stream 11 %BGcol%
rem Locate 15 35 
rem PrintColor 4)  14 %BGcol%
rem PrintColor Fansly 11 %BGcol%
rem Locate 21 28
rem PrintColor BACK 12 0
rem Locate 21 38
rem PrintColor MENU 14 0
rem ChangeColor 10 %BGcol%
rem MouseCMD 35,9,41,9 35,11,41,11 35,13,42,13 35,15,42,15 28,21,33,21 38,21,42,21
if %result%==1 goto websiteaudio
if %result%==2 goto websitevideo
if %result%==3 goto stream
if %result%==4 goto fansly
if %result%==5 goto Menu
if %result%==6 goto Menu
goto website


:websiteaudio
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings -x --audio-format mp3 --audio-quality 320k --newline --progress --no-playlist -o "Downloads/Websites/Audios/%%(title)s.%%(ext)s" -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:websitevideo
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings --newline -o "Downloads/Websites/Videos/%%(title)s.%%(ext)s" -f bestvideo+bestaudio/best -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:stream
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings --newline -o "Downloads/Websites/Streams/%%(title)s.%%(ext)s" -f bestvideo+bestaudio/best -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:fansly
cls
cd %~dp0
call cmd.exe /C fansly.exe
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

mode con:cols=80 lines=25
set BGcol=0
rem ChangeColor 7 %BGcol%
cls
:soundcloud
rem Paintscreen %BGcol%
rem ChangeColor 7 %BGcol%
rem PrintBox 19 44 2
rem PrintBox 15 38 %BGcol%
rem PrintCenter Soundcloud Downloader Menu 5 2 %BGcol%
rem ChangeColor 9 0
rem Locate 9 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor Track 11 %BGcol%
rem Locate 11 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Artist 11 %BGcol%
rem Locate 13 35
rem PrintColor 3)  14 %BGcol%
rem PrintColor Album 11 %BGcol%
rem Locate 15 35
rem PrintColor 4)  14 %BGcol%
rem PrintColor Playlist 11 %BGcol%
rem Locate 21 28
rem PrintColor BACK 12 0
rem Locate 21 38
rem PrintColor MENU 14 0
rem ChangeColor 10 %BGcol%
rem MouseCMD 35,9,41,9 35,11,42,11 35,13,41,13 35,15,44,15 28,21,33,21 38,21,42,21
if %result%==1 goto soundcloudtrack
if %result%==2 goto soundcloudartist
if %result%==3 goto soundcloudalbum
if %result%==4 goto soundcloudplaylist
if %result%==5 goto Menu
if %result%==6 goto Menu
goto soundcloud


:soundcloudtrack
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings -x --audio-format mp3 --audio-quality 320k --newline --progress --no-playlist -o "Downloads/SoundCloud/Tracks/%%(title)s.%%(ext)s" -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:soundcloudartist
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings -x --audio-format mp3 --audio-quality 320k --newline --progress --yes-playlist -o "Downloads/SoundCloud/Artists/%%(artist)s/%%(title)s.%%(ext)s" -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:soundcloudalbum
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings -x --audio-format mp3 --audio-quality 320k --newline --progress --yes-playlist -o "Downloads/SoundCloud/Albums/%%(album)s/%%(title)s.%%(ext)s" -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:soundcloudplaylist
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings -x --audio-format mp3 --audio-quality 320k --newline --progress --yes-playlist -o "Downloads/SoundCloud/Playlists/%%(playlist)s/%%(title)s.%%(ext)s" -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu
