@echo off
title Updating Files...

wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/fansly.exe -O fansly.exe 2>&1>nul
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/config.ini -O config.ini 2>&1>nul
wget -F -q --no-hsts https://github.com/SaoasBlubb/Multi-Downloader/releases/latest/download/Multi_Downloader.exe -O Multi_Downloader.exe 2>&1>nul


move /Y * .. 2>&1>nul
cd .. 2>&1>nul

start Multi_Downloader.exe 2>&1>nul
exit