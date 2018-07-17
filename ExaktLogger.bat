
@echo off
REM Diese Datei nie selbst oeffnen!!
if /i "%status%"=="on" goto loginexakt
goto logforbidden
:loginexakt
echo [%date:~0,2%.%date:~3,2%.%date:~6,4%] um %time:~0,2%:%time:~3,5% - %mode% >> "%cd%\LogsEXAKT.txt"
set mode=Fehlerhafte_Bestimmung
goto exitlog
:logforbidden
if /i "%mode%"=="Fehlerhafte_Bestimmung" set mode=* NAME UNDEFINED *
if /i "%mode%"=="" set mode=Exaktlogger
title ACCESS PERMISSION BLOCKED 
echo.
echo *************** ACCESS FORBIDDEN ***************
color c
echo.
echo ERROR 9998 - %mode% ist eine Systemdatei von Smart Speed. 
echo Der Zugriff auf diese Datei kann nur ueber das Hauptmenu erfolgen.
echo.
echo Bitte oeffnen Sie 'Smart Speed.bat', sonst melden Sie das Problem. 
pause >nul
exit
:exitlog