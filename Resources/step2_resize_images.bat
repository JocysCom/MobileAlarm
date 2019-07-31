@echo off
:: Image Magick:
:: http://www.imagemagick.org/script/command-line-processing.php
::
:: Create icons.
set n=icon.png
set i=Input/%n%
set o=Output/android
CALL:RES   48   48 "%o%/mipmap-mdpi/%n%"
CALL:RES   72   72 "%o%/mipmap-hdpi/%n%"
CALL:RES   96   96 "%o%/mipmap-xhdpi/%n%"
CALL:RES  144  144 "%o%/mipmap-xxhdpi/%n%"
CALL:RES  192  192 "%o%/mipmap-xxxhdpi/%n%"
CALL:RES  432  432 "%o%/drawable/about_logo.png"
::
:: Create backgrounds.
set n=launcher_foreground.png
set i=Input/%n%
set o=Output/android
CALL:RES  108  108 "%o%/mipmap-mdpi/%n%"
CALL:RES  162  162 "%o%/mipmap-hdpi/%n%"
CALL:RES  216  216 "%o%/mipmap-xhdpi/%n%"
CALL:RES  324  324 "%o%/mipmap-xxhdpi/%n%"
CALL:RES  432  432 "%o%/mipmap-xxxhdpi/%n%"
pause
GOTO:EOF

:RES
:: Set path to converter.
SET dfe=ImageMagick\convert.exe
SET exe=%dfe%
IF NOT EXIST "%exe%" SET exe=%ProgramFiles%\%dfe%
IF NOT EXIST "%exe%" SET exe=%ProgramFiles(x86)%\%dfe%
IF NOT EXIST "%exe%" SET exe=D:\Program Files\%dfe%
IF NOT EXIST "%exe%" SET exe=D:\Program Files (x86)\%dfe%
IF NOT EXIST "%exe%" GOTO:EOF
:: Resize image.
SET rsz=%1x%1
IF %2 gtr %1 SET rsz=%2x%2
SET d=%~dp3
echo %1 %2 %3
IF NOT EXIST "%d%" MKDIR "%d%"
"%exe%" -resize %rsz% -gravity center -extent %1x%2 %i% "%d%%~nx3"
::-gravity center -extent %2x%3
:: -resize %2x%3^ -flatten
GOTO:EOF