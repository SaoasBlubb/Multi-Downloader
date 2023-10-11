@echo off
title Updating Files...
taskkill /IM YouTube_Spotify_Downloader.exe 2>&1>nul
del YouTube_Spotify_Downloader.exe 2>&1>nul
ren YouTube_Spotify_Downloader.exe.new YouTube_Spotify_Downloader.exe 2>&1>nul
YouTube_Spotify_Downloader.exe 2>&1>nul
exit