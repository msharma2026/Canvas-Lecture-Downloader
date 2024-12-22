@echo off
setlocal enabledelayedexpansion

::Check if a URL was provided
if "%~1"=="" (
    echo Please provide a URL as an argument.
    echo Usage: %~nx0 "video-url"
    exit /b
)

set "URL=%~1"
set "baseName=filename"
set "extension=.mp4"
set "counter=1"

::Check for existing files and increment counter to avoid overwriting
:loop
if exist "%baseName%(!counter!)%extension%" (
    set /a counter+=1
    goto loop
)

::Run yt-dlp with the filename
yt-dlp.exe "%URL%" -o "%baseName%(!counter!)%extension%"
echo Download complete: %baseName%(!counter!)%extension%