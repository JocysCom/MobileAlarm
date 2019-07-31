@echo off
:: waifu2x source code and downloads:
:: https://github.com/DeadSix27/waifu2x-converter-cpp
:: Set path to converter.
SET dfe=waifu2x-DeadSix27\waifu2x-converter-cpp.exe
SET exe=%dfe%
IF NOT EXIST "%exe%" SET exe=%ProgramFiles%\%dfe%
IF NOT EXIST "%exe%" SET exe=%ProgramFiles(x86)%\%dfe%
IF NOT EXIST "%exe%" SET exe=D:\Program Files\%dfe%
IF NOT EXIST "%exe%" SET exe=D:\Program Files (x86)\%dfe%
IF NOT EXIST "%exe%" GOTO:EOF
FOR %%A IN ("%exe%") DO SET exd=%%~dpA
ECHO Converter: %exe%
ECHO Models:    %exd%
:: Upscale image.
"%exe%" --model-dir "%exd%\models_rgb" -i Input\icon-256x256.png --scale-ratio 4 --force-OpenCL -o Input\icon.png
copy /y Input\icon.png Input\launcher_foreground.png
pause