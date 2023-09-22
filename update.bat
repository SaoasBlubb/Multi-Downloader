@echo off
taskkill /IM YouTube_Spotify_Downloader.exe
del YouTube_Spotify_Downloader.exe
ren YouTube_Spotify_Downloader.exe.new YouTube_Spotify_Downloader.exe
start YouTube_Spotify_Downloader.exe
exit