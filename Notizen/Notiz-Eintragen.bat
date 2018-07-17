@echo off
cls
title SMART SPEED %version% - Create Notes
set mode=SS-Note entry %version%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
echo.
color 0F
echo *************** Notiz eintragen ***************
echo.
echo Was ist zu machen: (Genaue Beschreibung)
set /p note=--- 
echo.
if not exist "%cd%\note1.bat" set nr=1&goto send
if not exist "%cd%\note2.bat" set nr=2&goto send
if not exist "%cd%\note3.bat" set nr=3&goto send
if not exist "%cd%\note4.bat" set nr=4&goto send
if not exist "%cd%\note5.bat" set nr=5&goto send
if not exist "%cd%\note6.bat" set nr=6&goto send
if not exist "%cd%\note7.bat" set nr=7&goto send
if not exist "%cd%\note8.bat" set nr=8&goto send
if not exist "%cd%\note9.bat" set nr=9&goto send
if not exist "%cd%\note10.bat" set nr=10&goto send
if not exist "%cd%\note11.bat" set nr=11&goto send
if not exist "%cd%\note12.bat" set nr=12&goto send
if not exist "%cd%\note13.bat" set nr=13&goto send
if not exist "%cd%\note14.bat" set nr=14&goto send
if not exist "%cd%\note15.bat" set nr=15&goto send
echo Error 0002
echo Es koennen nicht mehr als 15 Notizen gespeichert werden!
timeout 20 >nul
exit
:send
echo echo Notiz %nr% am %date%: %note% >> "%cd%\note%nr%.bat"
