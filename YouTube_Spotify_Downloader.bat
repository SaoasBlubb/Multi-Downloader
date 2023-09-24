@echo off

REM setlocal DisableDelayedExpansion
REM for /f "tokens=2delims=:." %%A in ('2^>nul chcp') do (
    REM set /a "CP=%%A"
REM )
REM >nul chcp 65001
REM pushd "%~dp0"
REM for /f %%A in ('copy /z "%~nx0" nul') do (
    REM set "\R=%%A"
REM )
REM for /f %%A in ('forfiles /m "%~nx0" /c "cmd /c echo 0x1B"') do (
    REM set "\E=%%A"
REM )
REM (set \N=^
REM %=leave unchanged=%
REM )
REM set @PAUSE=^
REM set @DISP_HEAD=^
REM set @STRIP_WHITE_SPACES=^
REM (for %%a in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (^
    REM (set "_s=!?:~0,%%a!"^&^
    REM if "!_s: =!"==""^
        REM set^^ ?=!?:~%%a!)^&^
    REM (set "_s=!?:~-%%a!"^&^
    REM if "!_s: =!"==""^
        REM set^^ ?=!?:~0,-%%a!)^
REM ))^&^
REM set _s=
REM setlocal EnableDelayedExpansion

REM for /f "tokens=4,5delims=. " %%A in ('ver') do (
    REM if "%%A.%%B"=="10.0" (
        REM for %%C in (UNDERLINE`4 UNDERLINEOFF`24 RED`31 GREEN`32 YELLOW`33 CYAN`36 BRIGHTBLACK`90 BRIGHTBLUE`94 BRIGHTMAGENTA`95 BRIGHTWHITE`97 WHITE`37) do (
            REM for /f "tokens=1,2delims=`" %%D in ("%%C") do (
                REM set %%D=!\E![%%Em
            REM )
        REM )
    REM )
REM )


SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
REM echo ^<ESC^>[4m %ESC%[4mUnderline DisableDelayedExpansion%ESC%[0m

SETLOCAL EnableDelayedExpansion

REM for %%A in (yt-dlp.exe ffmpeg.exe ffprobe.exe spotdl.exe youtube-dl.exe ffplay.exe) do (
    REM set %%A=lib\%%A
REM )

REM if defined file_not_found (
    REM set file_not_found=
REM )
REM for %%A in (!yt-dlp.exe! !ffmpeg.exe! !ffprobe.exe! !spotdl.exe! !youtube-dl.exe! !ffplay.exe! choice.exe findstr.exe) do (
    REM >nul 2>&1 where %%A || (
        REM if %%A==choice.exe (
            REM set file_not_found=1
        REM ) else if %%A==findstr.exe (
            REM set file_not_found=1
        REM ) else (
            REM if not exist %%A (
                REM set file_not_found=1
            REM )
        REM )
        REM if defined file_not_found (
            REM echo:
            REM echo !RED!ERROR:!WHITE! "%%A" not found in your system PATH.
            REM goto :END
        REM )
    REM )
REM )


title Saoas' YouTube_Spotify_Downloader

mode con:cols=80 lines=25
set BGcol=0
rem ChangeColor 7 %BGcol%
cls
:Menu
rem Paintscreen %BGcol%
rem ChangeColor 7 %BGcol%
rem PrintBox 19 44 2
rem PrintBox 15 38 %BGcol%
rem PrintCenter Main Menu 5 11 %BGcol%
rem ChangeColor 9 0
rem Locate 9 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor YouTube 7 %BGcol%
rem Locate 11 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Spotify 7 %BGcol%
rem Locate 13 35
rem PrintColor 3)  14 %BGcol%
rem PrintColor Soundcloud 7 %BGcol%
rem Locate 15 35
rem PrintColor 4)  14 %BGcol%
rem PrintColor Website 7 %BGcol%
rem Locate 17 35
rem PrintColor 5)  14 %BGcol%
rem PrintColor Update 7 %BGcol%
rem PrintCenter Select option by click! 21 8 %BGcol%
rem ChangeColor 10 %BGcol%
rem MouseCMD 32,9,48,9 32,11,48,11 32,13,48,13 32,15,48,15 32,17,48,17 29,17,29,17
if %result%==1 goto youtube
if %result%==2 goto spotify
if %result%==3 goto soundcloud
if %result%==4 goto website
if %result%==5 goto update
REM Keep Menu if invalid input
goto Menu

REM :Menu
REM cls
REM ECHO.
REM ECHO !ESC![33m1) !WHITE!YouTube
REM ECHO !ESC![33m2) !WHITE!Spotify
REM ECHO !ESC![33m3) !WHITE!Soundcloud
REM ECHO !ESC![33m4) !WHITE!Website
REM ECHO !ESC![33m5) !WHITE!Update
REM ECHO.
REM SET /P option="!ESC![90mSelect option:!ESC![33m "
REM if %option% == 1 (goto youtube)
REM if %option% == 2 (goto spotify)
REM if %option% == 3 (goto soundcloud)
REM if %option% == 4 (goto website)
REM if %option% == 5 (goto update)
REM ECHO.
REM ECHO !RED!Unknown value
REM ECHO.
REM goto Menu

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
mkdir Update 2>&1>nul
rem ShadeBoxAt 13 32 1 2 2
wget -F -q https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/YouTube_Spotify_Downloader.exe -O Update\YouTube_Spotify_Downloader.exe
rem Wait 30
REM COPY MORE FILES HERE
cd Update 2>&1>nul
rem ShadeBoxAt 13 34 1 2 2
rem Wait 30
REM COPY MORE FILES HERE
ren YouTube_Spotify_Downloader.exe YouTube_Spotify_Downloader.exe.new 2>&1>nul
rem ShadeBoxAt 13 36 1 2 2
move /Y * .. 2>&1>nul
rem Wait 30
REM COPY MORE FILES HERE
cd .. 2>&1>nul
rd /s /q Update 2>&1>nul
rem ShadeBoxAt 13 38 1 2 2
cd C:\Saoas 2>&1>nul
rem Wait 30
REM COPY MORE FILES HERE
yt-dlp -q -U 2>&1>nul
rem ShadeBoxAt 13 40 1 2 2

rem Wait 30
REM COPY MORE FILES HERE

rem ShadeBoxAt 13 42 1 2 2

rem Wait 30
REM COPY MORE FILES HERE
pip install --upgrade spotdl 2>&1>nul
rem ShadeBoxAt 13 44 1 2 2

rem Wait 30
REM COPY MORE FILES HERE

rem ShadeBoxAt 13 46 1 2 2

rem Wait 30
REM COPY MORE FILES HERE
del C:\Saoas\*.old 2>&1>nul
rem ShadeBoxAt 13 48 1 2 2
cd /D "%~dp0" 2>&1>nul
start update.exe 2>&1>nul
rem ClearColor
rem Locate 25 1

exit
goto Menu

REM :update
REM Echo Updating...
REM yt-dlp -q -U 2>&1>nul
REM spotdl --check-for-updates >nul

mode con:cols=80 lines=25
set BGcol=0
rem ChangeColor 7 %BGcol%
cls
:youtube
rem Paintscreen %BGcol%
rem ChangeColor 7 %BGcol%
rem PrintBox 19 44 2
rem PrintBox 15 38 %BGcol%
rem PrintCenter YouTube Downloader Menu 5 11 %BGcol%
rem ChangeColor 9 0
rem Locate 10 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor Song 7 %BGcol%
rem Locate 12 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Playlist 7 %BGcol%
rem Locate 14 35
rem PrintColor 3)  14 %BGcol%
rem PrintColor Menu 7 %BGcol%
rem Locate 16 35
rem PrintCenter Click on option! 21 8 %BGcol%
rem ChangeColor 10 %BGcol%
rem MouseCMD 32,10,48,10 32,12,48,12 32,14,48,14 32,16,48,16 29,17,29,17
if %result%==1 goto song
if %result%==2 goto playlist
if %result%==3 goto Menu
REM Keep Menu if invalid input
goto youtube

REM :youtube
REM cls
REM ECHO.
REM ECHO !ESC![33m1) !WHITE!Song
REM ECHO !ESC![33m2) !WHITE!Playlist
REM ECHO.
REM SET /P option="!ESC![90mSelect option:!ESC![33m "
REM if %option% == 1 (goto song)
REM if %option% == 2 (goto playlist)
REM ECHO.
REM ECHO !RED!Unknown value
REM ECHO.
REM goto youtube

mode con:cols=80 lines=25
set BGcol=0
rem ChangeColor 7 %BGcol%
cls
:song
rem Paintscreen %BGcol%
rem ChangeColor 7 %BGcol%
rem PrintBox 19 44 2
rem PrintBox 15 38 %BGcol%
rem PrintCenter YouTube Audio/Video Download Menu 5 11 %BGcol%
rem ChangeColor 9 0
rem Locate 10 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor Audio 7 %BGcol%
rem Locate 12 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Video 7 %BGcol%
rem Locate 14 35
rem PrintColor 3)  14 %BGcol%
rem PrintColor Menu 7 %BGcol%
rem Locate 16 35
rem PrintCenter Click on option! 21 8 %BGcol%
rem ChangeColor 10 %BGcol%
rem MouseCMD 32,10,48,10 32,12,48,12 32,14,48,14 32,16,48,16 29,17,29,17
if %result%==1 goto audio
if %result%==2 goto video
if %result%==3 goto Menu
REM Keep Menu if invalid input
goto song

REM :song
REM cls
REM ECHO.
REM ECHO !ESC![33m1) !WHITE!Audio
REM ECHO !ESC![33m2) !WHITE!Video
REM ECHO.
REM SET /P option="!ESC![90mSelect option:!ESC![33m "
REM if %option% == 1 (goto audio)
REM if %option% == 2 (goto video)
REM ECHO.
REM ECHO !RED!Unknown value
REM ECHO.
REM goto song

:video
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings --newline --progress --no-playlist -o "Downloads/YouTube/Videos/%%(title)s.%%(ext)s" -f bestvideo+bestaudio/best -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:audio
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings -x --audio-format mp3 --audio-quality 320k --newline --progress --no-playlist -o "Downloads/YouTube/Songs/%%(title)s.%%(ext)s" -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

mode con:cols=80 lines=25
set BGcol=0
rem ChangeColor 7 %BGcol%
cls
:playlist
rem Paintscreen %BGcol%
rem ChangeColor 7 %BGcol%
rem PrintBox 19 44 2
rem PrintBox 15 38 %BGcol%
rem PrintCenter YouTube Playlist Download Menu 5 11 %BGcol%
rem ChangeColor 9 0
rem Locate 10 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor Audio 7 %BGcol%
rem Locate 12 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Video 7 %BGcol%
rem Locate 14 35
rem PrintColor 3)  14 %BGcol%
rem PrintColor Menu 7 %BGcol%
rem Locate 16 35
rem PrintCenter Click on option! 21 8 %BGcol%
rem ChangeColor 10 %BGcol%
rem MouseCMD 32,10,48,10 32,12,48,12 32,14,48,14 32,16,48,16 29,17,29,17
if %result%==1 goto playlistaudio
if %result%==2 goto playlistvideo
if %result%==3 goto Menu
REM Keep Menu if invalid input
goto playlist

REM :playlist
REM cls
REM ECHO.
REM ECHO !ESC![33m1) !WHITE!Audio
REM ECHO !ESC![33m2) !WHITE!Video
REM ECHO.
REM SET /P option="!ESC![90mSelect option:!ESC![33m "
REM if %option% == 1 (goto playlistaudio)
REM if %option% == 2 (goto playlistvideo)
REM ECHO.
REM ECHO !RED!Unknown value
REM ECHO.
REM goto playlist

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

:playlistaudio
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings -x --audio-format mp3 --audio-quality 320k --newline --progress --yes-playlist -o "Downloads/YouTube/Songs/Playlists/%%(playlist)s/%%(title)s.%%(ext)s" -i --ignore-config "%URL%"
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
rem PrintCenter Spotify Downloader Menu 5 11 %BGcol%
rem ChangeColor 9 0
rem Locate 10 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor Track 7 %BGcol%
rem Locate 12 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Playlist 7 %BGcol%
rem Locate 14 35
rem PrintColor 3)  14 %BGcol%
rem PrintColor Menu 7 %BGcol%
rem Locate 16 35
rem PrintCenter Click on option! 21 8 %BGcol%
rem ChangeColor 10 %BGcol%
rem MouseCMD 32,10,48,10 32,12,48,12 32,14,48,14 32,16,48,16 29,17,29,17
if %result%==1 goto singlespotify
if %result%==2 goto playlistspotify
if %result%==3 goto Menu
REM Keep Menu if invalid input
goto spotify

REM :spotify
REM cls
REM ECHO.
REM ECHO !ESC![33m1) !WHITE!Track
REM ECHO !ESC![33m2) !WHITE!Playlist
REM ECHO.
REM SET /P option="!ESC![90mSelect option:!ESC![33m "
REM if %option% == 1 (goto singlespotify)
REM if %option% == 2 (goto playlistspotify)
REM ECHO.
REM ECHO !RED!Unknown value
REM ECHO.
REM goto spotify

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

mode con:cols=80 lines=25
set BGcol=0
rem ChangeColor 7 %BGcol%
cls
:website
rem Paintscreen %BGcol%
rem ChangeColor 7 %BGcol%
rem PrintBox 19 44 2
rem PrintBox 15 38 %BGcol%
rem PrintCenter Website Downloader Menu 5 11 %BGcol%
rem ChangeColor 9 0
rem Locate 10 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor Site URL 7 %BGcol%
rem Locate 12 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Menu 7 %BGcol%
rem Locate 16 35
rem PrintCenter Click on option! 21 8 %BGcol%
rem ChangeColor 10 %BGcol%
rem MouseCMD 32,10,48,10 32,12,48,12 32,14,48,14 32,16,48,16 29,17,29,17
if %result%==1 goto url
if %result%==2 goto Menu
REM Keep Menu if invalid input
goto website

REM :website
REM cls
REM ECHO.
REM ECHO !ESC![33m1) !WHITE!URL
REM ECHO.
REM SET /P option="!ESC![90mSelect option:!ESC![33m "
REM if %option% == 1 (goto url)
REM if %option% == 2 (goto menu)
REM ECHO.
REM ECHO !RED!Unknown value
REM ECHO.
REM goto website

:url
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings --newline -o "Downloads/Websites/Videos/%%(title)s.%%(ext)s" -f bestvideo+bestaudio/best -i --ignore-config "%URL%"
REM yt-dlp --no-warnings -x --audio-format mp3 --audio-quality 320k --newline -o "Downloads/Websites/Audios/%(title)s.%(ext)s" -i --ignore-config "%URL%"

REM youtube-dl --no-warnings --newline -o "Downloads/Websites/Videos/%%(title)s.%%(ext)s" -f bestvideo+bestaudio/best -i --ignore-config "%URL%"
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
rem PrintCenter Soundcloud Downloader Menu 5 11 %BGcol%
rem ChangeColor 9 0
rem Locate 10 35
rem PrintColor 1)  14 %BGcol%
rem PrintColor Track 7 %BGcol%
rem Locate 12 35 
rem PrintColor 2)  14 %BGcol%
rem PrintColor Playlist 7 %BGcol%
rem Locate 14 35
rem PrintColor 3)  14 %BGcol%
rem PrintColor Menu 7 %BGcol%
rem Locate 16 35
rem PrintCenter Click on option! 21 8 %BGcol%
rem ChangeColor 10 %BGcol%
rem MouseCMD 32,10,48,10 32,12,48,12 32,14,48,14 32,16,48,16 32,18,48,18 29,17,29,17
if %result%==1 goto tracksoundcloud
if %result%==2 goto playlistsoundcloud
if %result%==3 goto Menu
REM Keep Menu if invalid input
goto soundcloud

REM :soundcloud
REM cls
REM ECHO.
REM ECHO !ESC![33m1) !WHITE!Track
REM ECHO !ESC![33m2) !WHITE!Playlist
REM ECHO !ESC![33m3) !WHITE!Menu
REM ECHO.
REM SET /P option="!ESC![90mSelect option:!ESC![33m "
REM if %option% == 1 (goto tracksoundcloud)
REM if %option% == 2 (goto playlistsoundcloud)
REM if %option% == 3 (goto Menu)
REM ECHO.
REM ECHO !RED!Unknown value
REM ECHO.
REM goto soundcloud

:tracksoundcloud
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings -x --audio-format mp3 --audio-quality 320k --newline --progress --no-playlist -o "Downloads/SoundCloud/Tracks/%%(title)s.%%(ext)s" -i --ignore-config "%URL%"
REM youtube-dl --no-warnings --newline -o "Downloads/Soundcloud/Tracks/%%(title)s.%%(ext)s" -f bestvideo+bestaudio/best -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

:playlistsoundcloud
cls
cd %~dp0
ECHO.
SET /P URL="!ESC![90m[Enter URL]:!ESC![33m "
ECHO.
ECHO !ESC![35mStarting Download...
yt-dlp --no-warnings -x --audio-format mp3 --audio-quality 320k --newline --progress --yes-playlist -o "Downloads/SoundCloud/Playlists/%%(playlist)s/%%(title)s.%%(ext)s" -i --ignore-config "%URL%"
REM youtube-dl --no-warnings --newline -o "Downloads/Soundcloud/Playlists/%%(playlist)s/%%(title)s.%%(ext)s" -f bestvideo+bestaudio/best -i --ignore-config "%URL%"
ECHO.
ECHO !ESC![32mDone!
timeout 2 >nul
goto Menu

REM playlist_id (string): Identifier of the playlist that contains the video
REM playlist_title (string): Name of the playlist that contains the video
REM playlist (string): playlist_id or playlist_title
REM playlist_count (numeric): Total number of items in the playlist. May not be known if entire playlist is not extracted
REM playlist_index (numeric): Index of the video in the playlist padded with leading zeros according the final index
REM playlist_autonumber (numeric): Position of the video in the playlist download queue padded with leading zeros according to the total length of the playlist
REM playlist_uploader (string): Full name of the playlist uploader
REM playlist_uploader_id (string): Nickname or id of the playlist uploader
