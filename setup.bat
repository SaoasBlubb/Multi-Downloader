@echo off

<!-- : --- Self-elevating.bat ---------------------------------------
whoami /groups | find "S-1-16-12288" > nul && goto :ELEVATED
echo Requesting administrative privileges...
set "ELEVATE_CMDLINE=cd /d "%cd%" & call "%~f0" %*"
cscript //nologo "%~f0?.wsf" //job:Elevate & exit /b

-->
<job id="Elevate"><script language="VBScript">
  Set objShell = CreateObject("Shell.Application")
  Set objWshShell = WScript.CreateObject("WScript.Shell")
  Set objWshProcessEnv = objWshShell.Environment("PROCESS")
  strCommandLine = Trim(objWshProcessEnv("ELEVATE_CMDLINE"))
  objShell.ShellExecute "cmd", "/c " & strCommandLine, "", "runas"
</script></job>
:ELEVATED -----------------------------------------------------------

title Installing Chocolatey!...

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

powershell -Command Add-MpPreference -ExclusionProcess "Multi_Downloader.exe" -Force
powershell -Command Add-MpPreference -ExclusionProcess "fansly.exe" -Force
powershell -Command Add-MpPreference -ExclusionProcess "update.exe" -Force
powershell -Command Add-MpPreference -ExclusionProcess "MD_KILL.exe" -Force

mkdir "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader"
move config.ini "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader"
move fansly.exe "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader"
move Multi_Downloader.exe "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader"
move path.ps1 "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader"

cd "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader"

title Downloading Files!...

REM wget -q --show-progress --user-agent="chrome" --no-hsts https://files.saoas.tv/Multi_Downloader/fansly.exe -O fansly.exe
REM wget -q --show-progress --user-agent="chrome" --no-hsts https://files.saoas.tv/Multi_Downloader/config.txt -O config.ini
REM ren config.txt config.ini
REM wget -q --show-progress --user-agent="chrome" --no-hsts https://files.saoas.tv/Multi_Downloader/Multi_Downloader.exe -O Multi_Downloader.exe

mkdir lib
cd lib
powershell Invoke-WebRequest -Uri "https://eternallybored.org/misc/wget/1.21.4/64/wget.exe" -OutFile "wget.exe" 


title Installing needed Tools!...

wget -q --show-progress --user-agent="chrome" --no-hsts https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -O ffmpeg-master-latest-win64-gpl.zip
tar -xf ffmpeg-master-latest-win64-gpl.zip
del /S /q ffmpeg-master-latest-win64-gpl.zip
cd ffmpeg-master-latest-win64-gpl\bin
xcopy * ..\.. /s /e /Y
cd ..\.. 
rd /S /q ffmpeg-master-latest-win64-gpl
cd .. 


mkdir "C:\Saoas"
cd "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader/lib"
move * "C:\Saoas"
cd "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader"
rd /S /q "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader/lib"

title Setting Up Variable Paths...

REM wget -q --show-progress --user-agent="chrome" --no-hsts https://files.saoas.tv/Multi_Downloader/path.txt -O path.ps1
REM ren path.txt path.ps1

REM cmd /c ren "C:\Users\Saoas\Desktop\Saoas_Tools\Multi_Downloader\path.txt" path.ps1
cd %USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader/

echo A | powershell.exe  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
cmd /c powershell "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader/path.ps1"

del /S /q "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader/path.ps1"
del /S /q "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader/wget.exe"

title Installing Python!...

choco install python311 -y
cmd /c refreshenv
cmd /c python -m pip install --upgrade pip
cmd /c pip install yt-dlp
cmd /c pip install spotdl

start "" "%USERPROFILE%/Desktop/Saoas_Tools/Multi_Downloader/Multi_Downloader.exe"

exit
