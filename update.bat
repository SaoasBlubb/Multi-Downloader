@echo off
title Updating Files...
call cmd.exe /C taskkill /IM YouTube_Spotify_Downloader.exe 2>&1>nul
timeout 0 /nobreak >nul
del YouTube_Spotify_Downloader.exe 2>&1>nul
call cmd.exe /C ren YouTube_Spotify_Downloader.exe.new YouTube_Spotify_Downloader.exe 2>&1>nul
call cmd.exe /C start YouTube_Spotify_Downloader.exe 2>&1>nul
exit