@echo off
set versionkalrem=0.5
cls
title SMART SPEED - Kalender %versionkalrem%
set mode=SS-Kalender %versionkalrem%
rem if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
:sskalender
color F
cls
echo.
echo *************** SS-Kalender %versionkalrem% ***************
echo.
set id=0
set /a remfrist=8-%date:~0,2%
:reset
set /a id=%id%+1
pause
if exist "1_test_%id%.bat" (
call "1_test_%id%.bat" >nul
if /i "%dna:~1,9%"=="UNBEKANNT" set testunkown%id%=YES&REM NICHT ERINNERN am ende der erinnerungen max warnen da datum unbekannt und goto damit nicht gerechnet
if %dna:~1,2% LEQ 7 set /a remmonth%id%=%dna:~3,2%-1&set /a remday%id%=30-%remfrist%&set remyear%id%=%dna:~7,4%
if %dna:~1,2% GEQ 8 set remmonth%id%=%dna:~3,2%&set /a remday%id%=%dna:~1,2%-7&set remyear%id%=%dna:~7,4%
pause
)
if exist "2_geburtstag_%id%.bat" (
call "2_geburtstag_%id%.bat" >nul
if /i "%dna:~1,9%"=="UNBEKANNT" set gebunkown%id%=YES&REM NICHT ERINNERN am ende der erinnerungen max warnen da datum unbekannt und goto damit nicht gerechnet
if %dna:~1,2% LEQ 7 set /a remmonth%id%=%dna:~3,2%-1&set /a remday%id%=30-%remfrist%&set remyear%id%=%dna:~7,4%
if %dna:~1,2% GEQ 8 set remmonth%id%=%dna:~3,2%&set /a remday%id%=%dna:~1,2%-7&set remyear%id%=%dna:~7,4%
) 
if exist "3_sa_%id%.bat" (
call "3_sa_%id%.bat" >nul
if /i "%dna:~1,9%"=="UNBEKANNT" set saunkown%id%=YES&REM NICHT ERINNERN am ende der erinnerungen max warnen da datum unbekannt und goto damit nicht gerechnet
if %dna:~1,2% LEQ 7 set /a remmonth%id%=%dna:~3,2%-1&set /a remday%id%=30-%remfrist%&set remyear%id%=%dna:~7,4%
if %dna:~1,2% GEQ 8 set remmonth%id%=%dna:~3,2%&set /a remday%id%=%dna:~1,2%-7&set remyear%id%=%dna:~7,4%
) 
if exist "4_event_%id%.bat" (
call "4_event_%id%.bat" >nul
REM >nul um echo nicht anzuzeigen
if /i "%dna:~1,9%"=="UNBEKANNT" set eventunkown%id%=YES&REM NICHT ERINNERN am ende der erinnerungen max warnen da datum unbekannt und goto damit nicht gerechnet
if %dna:~1,2% LEQ 7 set /a remmonth%id%=%dna:~3,2%-1&set /a remday%id%=30-%remfrist%&set remyear%id%=%dna:~7,4%
if %dna:~1,2% GEQ 8 set remmonth%id%=%dna:~3,2%&set /a remday%id%=%dna:~1,2%-7&set remyear%id%=%dna:~7,4%
REM HIER erinnern je nach Prioritaet von Fach mit %dna:~0,10% und hier da definiert
)
if "%id%"=="15" goto remember
if %id% GTR 15 echo ERROR 972: Maximal Laufzeit ueberschritten.
goto reset
echo ERROR 973: Sprungmarke 'reset' uebersprungen oder SM 'remember' ruecklaeufig.
:remember
set dna=UNDEFINED
cls
REM !!!!!!!!!!!!!!! KOMPATIBLE ERINNERUNG ZU KALENDER ASSIST. also kein Stop sondern alle Erinnerungen fliessend zum Kalender anzeigen. 

REM Mit Countdown. Und Stoff bei genauerem Aufruf. 
pause