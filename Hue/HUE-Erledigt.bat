@echo off
cls
title SMART SPEED %version% - HUE erledigt
color A
set mode=SS-Hue done %version%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
echo.
echo ************** HUE-Erledigt ***************
echo.
for /L %%a in (1 1 15) do if exist "%cd%\hue%%ae.bat" del "%cd%\hue%%ae.bat"
set hueregister=
cls
echo.
echo *************** HUE-Erledigt ***************
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
if "%keine%"=="15" echo ~ Keine offenen Hausaufgaben!&echo ~ Have Fun! :-)&timeout 5 >nul&goto end
echo.
color a
echo Bitte waehle die HUE-Registernummer:
set /p hueregister=--- 
if not exist "hue%hueregister%.bat" echo ERROR 404: Hausuebung existiert nicht!&timeout 7 >nul&goto end
ren "%cd%\hue%hueregister%.bat" "hue%hueregister%e.bat"
echo echo !! HUE %hueregister% ERLEDIGT !! >> "%cd%\hue%hueregister%e.bat"
if exist "hue%hueregister%e.bat" echo HUE erfolgreich in den Papierkorb verschoben!&timeout 4 >nul&goto end
:end
cd ..