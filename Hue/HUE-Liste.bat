@echo off
cd HUE
echo.
title SMART SPEED %version% - HUE Liste
color 0f
set mode=Hue List %version%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
echo *************** Unfertige HUEs ********************
echo.
set keine=0
echo Offene Hausaufgaben: 
if not exist "%cd%\hue1.bat" set /a keine=%keine%+1&goto 2
call "%cd%\hue1.bat"
:2
if not exist "%cd%\hue2.bat" set /a keine=%keine%+1&goto 3
call "%cd%\hue2.bat"
:3
if not exist "%cd%\hue3.bat" set /a keine=%keine%+1&goto 4
call "%cd%\hue3.bat"
:4
if not exist "%cd%\hue4.bat" set /a keine=%keine%+1&goto 5
call "%cd%\hue4.bat"
:5
if not exist "%cd%\hue5.bat" set /a keine=%keine%+1&goto 6
call "%cd%\hue5.bat"
:6
if not exist "%cd%\hue6.bat" set /a keine=%keine%+1&goto 7
call "%cd%\hue6.bat"
:7
if not exist "%cd%\hue7.bat" set /a keine=%keine%+1&goto 8
call "%cd%\hue7.bat"
:8
if not exist "%cd%\hue8.bat" set /a keine=%keine%+1&goto 9
call "%cd%\hue8.bat"
:9
if not exist "%cd%\hue9.bat" set /a keine=%keine%+1&goto 10
call "%cd%\hue9.bat"
:10
if not exist "%cd%\hue10.bat" set /a keine=%keine%+1&goto 11
call "%cd%\hue10.bat"
:11
if not exist "%cd%\hue11.bat" set /a keine=%keine%+1&goto 12
call "%cd%\hue11.bat"
:12
if not exist "%cd%\hue12.bat" set /a keine=%keine%+1&goto 13
call "%cd%\hue12.bat"
:13
if not exist "%cd%\hue13.bat" set /a keine=%keine%+1&goto 14
call "%cd%\hue13.bat"
:14
if not exist "%cd%\hue14.bat" set /a keine=%keine%+1&goto 15
call "%cd%\hue14.bat"
:15
if not exist "%cd%\hue15.bat" set /a keine=%keine%+1&goto pause
call "%cd%\hue15.bat"
:pause
if "%keine%"=="15" color A&echo ~ Keine offenen Hausaufgaben!&echo ~ Have Fun! :-)
echo.
echo * (1) Neue Hausaufgabe * (2) HUE erledigt * (3) HUE editieren * (4) Notizen *
set pro=~ SMART SPEED PRO nicht installiert! :(				(0) NICHTS
cd ..
if exist "%cd%\smart Speed - Pro.bat" set pro=~ SMART SPEED PRO vorhanden! (5)				(0) NICHTS
cd HUE
echo %pro%
set /p load=--- 
set load=%load:~0,1%
if "%load%"=="1" call "%cd%\HUE-Eintragen.bat"&goto hueend
if "%load%"=="2" call "%cd%\HUE-Erledigt.bat"&goto hueend
if "%load%"=="3" call "%cd%\hue-Edit.bat"&goto hueend
cd ..
if "%load%"=="4" call "%cd%\notizen\notiz-menu.bat"&goto hueend
if "%load%"=="5" if exist "%cd%\smart Speed - Pro.bat" call "%cd%\smart Speed - Pro.bat"&goto hueend
if not exist "%cd%\smart Speed - Pro.bat" echo ERROR 404: SMART SPEED PRO nicht installiert!&timeout 15 >Nul&goto hueend
if "%load%"=="0" goto hueend
echo ERROR 404 - Eingabe existiert nicht!
timeout 10 >nul
goto hueend

:hueend
cd..