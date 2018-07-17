@echo off

set status=ON
set ssallow=yes
if /i "%status%"=="OFF" exit
Rem if /i "%username%"=="Kevin" set ssallow=yes
rem if /i "%ssallow%"=="no" echo.&echo ERROR 9999: Sie haben keine Berechtigung fuer diese Anwendung!


title Smart Speed %version%
mode con lines=30 cols=90
color A 
set version=6.5
echo [%date:~0,2%.%date:~3,2%.%date:~6,4%] um %time:~0,2%:%time:~3,5% - Smart Speed %version% startet succesfully... >> "Logs.txt"
set mode=Smart Speed %version%
if exist "%cd%\ExaktLogger.bat" call "ExaktLogger.bat"
:start
cls 
echo. 
echo ************* Smart Speed %version% *************** 
echo. 
echo Bitte warten...
echo Smart Speed wird geladen :-)
echo.
echo Programmdateien werden gesucht...
echo.
REM Programmdatei Ueberpruefung
set syserror=NO
cls
echo.
echo ************* Smart Speed %version% *************** 
echo.  
if not exist "%cd%\Start\Speziell\weihnachten.bat" set syserror=YES&echo ERROR 4041: Fehlende Programmdatei. - Weihnachten.bat fehlt
if not exist "%cd%\Start\Speziell\silvester.bat" set syserror=YES&echo ERROR 4042: Fehlende Programmdatei. - Silvester.bat fehlt
if not exist "%cd%\Start\Speziell\geburtstag.bat" set syserror=YES&echo ERROR 4043: Fehlende Programmdatei. - Geburtstag.bat fehlt
if not exist "%cd%\Start\Speziell\halloween.bat" set syserror=YES&echo ERROR 4044: Fehlende Programmdatei. - Halloween.bat fehlt
if not exist "%cd%\Notizen\Notiz-Liste.bat" set syserror=YES&echo ERROR 4045: Fehlende Programmdatei. - Notiz-Liste.bat fehlt
if not exist "%cd%\Hue\HUE-Liste.bat" set syserror=YES&echo ERROR 4046: Fehlende Programmdatei. - HUE-Liste.bat fehlt
if not exist "%cd%\Dokumente\Dokument.bat" set syserror=YES&echo ERROR 4047: Fehlende Programmdatei. - Dokument.bat fehlt
if not exist "%cd%\ExaktLogger.bat" set syserror=YES&echo ERROR 4048: Fehlende Programmdatei. - ExaktLogger.bat fehlt
if /i "%syserror%"=="YES" color c&echo.&echo SMART SPEED wird abgebrochen...&echo Bitte installiere SS neu.&pause >nul&exit

REM Start Feiertags Pruefung
if "%date:~0,5%"=="24.12" call "%cd%\Start\Speziell\weihnachten.bat"
if "%date:~0,5%"=="31.12" call "%cd%\Start\Speziell\silvester.bat"
if "%date:~0,5%"=="7.2" call "%cd%\Start\Speziell\geburtstag.bat"
if "%date:~0,5%"=="31.10" call "%cd%\Start\Speziell\halloween.bat"

REM Kalender Termin Ueberpruefung
REM Nur erinnern wenn das Zieldatum nur noch weniger als 1 Woche entfernt! 

REM Rest aufrufen
call "%cd%\Notizen\Notiz-Liste.bat"
cd ..

call "%cd%\Hue\HUE-Liste.bat"

cd Smart Speed
call "%cd%\Dokumente\Dokument.bat"

REM Kalender Assist Start zur Pruefung von Events, etc.
REM Bei Geburtstage und Geschenke [1997] mit aktuellem Jahr Problem loesen. Sodass jedes Jahr erinnert wird.
exit