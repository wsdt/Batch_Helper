@echo off
cls
title SMART SPEED %version% - HUE eintragen
set mode=SS-Hue Entry %version%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
echo.
color 0F
echo *************** Hue eintragen ***************
echo.
echo Was ist zu machen: (Genaue Beschreibung, inkl. Fach!)
set /p hue=--- 
echo.
if not exist "%cd%\hue1.bat" set nr=1&goto send
if not exist "%cd%\hue2.bat" set nr=2&goto send
if not exist "%cd%\hue3.bat" set nr=3&goto send
if not exist "%cd%\hue4.bat" set nr=4&goto send
if not exist "%cd%\hue5.bat" set nr=5&goto send
if not exist "%cd%\hue6.bat" set nr=6&goto send
if not exist "%cd%\hue7.bat" set nr=7&goto send
if not exist "%cd%\hue8.bat" set nr=8&goto send
if not exist "%cd%\hue9.bat" set nr=9&goto send
if not exist "%cd%\hue10.bat" set nr=10&goto send
if not exist "%cd%\hue11.bat" set nr=11&goto send
if not exist "%cd%\hue12.bat" set nr=12&goto send
if not exist "%cd%\hue13.bat" set nr=13&goto send
if not exist "%cd%\hue14.bat" set nr=14&goto send
if not exist "%cd%\hue15.bat" set nr=15&goto send
echo Error 0001
echo Es koennen nicht mehr als 15 Hausaufgaben gespeichert werden!
timeout 20 >nul
exit
:send
echo color c >> "%cd%\hue%nr%.bat"
echo echo HUE %nr% am %date%: %hue% >> "%cd%\hue%nr%.bat"
if exist "%cd%\hue%nr%.bat" echo HUE erfolgreich gespeichert!
if not exist "%cd%\hue%nr%.bat" echo HUE wurde NICHT gespeichert!
timeout 4 >Nul
cd ..