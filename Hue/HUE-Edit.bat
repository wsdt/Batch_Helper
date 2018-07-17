@echo off
cls
color F
title SMART SPEED %version% - HUE Edit
set mode=SS-HUE Edit %version%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
echo.
echo ********** HUE - Edit **********
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
color F
if "%keine%"=="15" echo ~ Keine offenen Hausaufgaben!&echo ~ Have Fun! :-)&timeout 5 >nul&goto end
echo.
echo Welche HUE willst du bearbeiten? [REG-Nr. eingeben]
set /p hueedit=--- 
echo.
echo Aktueller Inhalt:
if not exist "%cd%\hue%hueedit%.bat" echo ERROR 404: HUE existiert nicht!&timeout 7 >nul&goto end
call "%cd%\hue%hueedit%.bat"
color f
echo.
echo Neuer Inhalt:
set /p hueneu=--- 
del "%cd%\hue%hueedit%.bat"
echo color c >> "%cd%\hue%hueedit%.bat"
echo echo HUE %hueedit% am %date%: %hueneu% >> "%cd%\hue%hueedit%.bat"
:end
cd ..