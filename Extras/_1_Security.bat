@echo off
REM Wenn eingebaut dann @echo off entfernen!

set secversion=1.0
set mode=SS-Security STARTUP %secversion% - Under Construction
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
set securebreak=YES
if /i "%fach%"=="PAUSE" start "cmd.exe" "C:\users\%username%\desktop\smart speed\extras\6_security.lnk"
if /i "%fach%"=="GROSSE PAUSE" start "cmd.exe" "C:\users\%username%\desktop\smart speed\extras\6_security.lnk"
if /i "%fach%"=="MITTAGSPAUSE" start "cmd.exe" "C:\users\%username%\desktop\smart speed\extras\6_security.lnk"