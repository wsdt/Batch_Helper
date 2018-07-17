@echo off
cd Notizen
cls
echo.
title SMART SPEED %version% - Note List
set mode=SS-Note Liste %version%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
color 0f
echo *************** Unerledigte Notizen ***************
echo.
set keine=0
echo Offene Notizen:
if not exist "%cd%\note1.bat" set /a keine=%keine%+1&goto 2
call "%cd%\note1.bat"
:2
if not exist "%cd%\note2.bat" set /a keine=%keine%+1&goto 3
call "%cd%\note2.bat"
:3
if not exist "%cd%\note3.bat" set /a keine=%keine%+1&goto 4
call "%cd%\note3.bat"
:4
if not exist "%cd%\note4.bat" set /a keine=%keine%+1&goto 5
call "%cd%\note4.bat"
:5
if not exist "%cd%\note5.bat" set /a keine=%keine%+1&goto 6
call "%cd%\note5.bat"
:6
if not exist "%cd%\note6.bat" set /a keine=%keine%+1&goto 7
call "%cd%\note6.bat"
:7
if not exist "%cd%\note7.bat" set /a keine=%keine%+1&goto 8
call "%cd%\note7.bat"
:8
if not exist "%cd%\note8.bat" set /a keine=%keine%+1&goto 9
call "%cd%\note8.bat"
:9
if not exist "%cd%\note9.bat" set /a keine=%keine%+1&goto 10
call "%cd%\note9.bat"
:10
if not exist "%cd%\note10.bat" set /a keine=%keine%+1&goto 11
call "%cd%\note10.bat"
:11
if not exist "%cd%\note11.bat" set /a keine=%keine%+1&goto 12
call "%cd%\note11.bat"
:12
if not exist "%cd%\note12.bat" set /a keine=%keine%+1&goto 13
call "%cd%\note12.bat"
:13
if not exist "%cd%\note13.bat" set /a keine=%keine%+1&goto 14
call "%cd%\note13.bat"
:14
if not exist "%cd%\note14.bat" set /a keine=%keine%+1&goto 15
call "%cd%\note14.bat"
:15
if not exist "%cd%\note15.bat" set /a keine=%keine%+1&goto pause
call "%cd%\note15.bat"
:pause
if "%keine%"=="15" echo ~ Keine Notizen gefunden! :-)