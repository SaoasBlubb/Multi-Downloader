@echo off
title Updating Files...
taskkill /IM Multi_Downloader.exe 2>&1>nul
del Multi_Downloader.exe 2>&1>nul
cmd /c ren Multi_Downloader.exe.new Multi_Downloader.exe 2>&1>nul
Multi_Downloader.exe 2>&1>nul
exit