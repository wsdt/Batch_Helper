
if not defined "%version%" @echo off
title SS-Countdown BENUTZERDEFINIERT %countdownversion% 
set mode=SS-Countdown_BD %countdownversion%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
:recount
mode con lines=20 cols=85
cls
echo.
echo ************* Smart Speed PRO %version% BETA ***************
echo.
echo Willkommen beim Countdown-Timer von Smart Speed!
echo.
set countfolge=Fehlende Eingabe
echo Was passiert nach Ablaufen des Countdowns?
set /p countfolge=--- 
echo.
echo Welcher Befehl soll nach Ablaufen ausgefuehrt werden?
echo Bei keiner Action "echo." eingeben.
set /p doaction=--- 
cls
echo.
echo ************* Smart Speed PRO %version% BETA ***************
echo.
echo Willkommen beim Countdown-Timer von Smart Speed!
echo.
set bentime=NN
echo Geben Sie den Countdown selbst in Sekunden an!
set /p bentime=--- 
if %bentime% LEQ 0 echo ERROR 133: Wert zu niedrig! [mind. 1]&timeout 10 >Nul&goto recount
goto calculate

:calculate
mode con lines=10 cols=50

:countdowntimer
set /a minlimit=%bentime%/20
set /a maxlimit=%bentime%-%bentime%/20
SETLOCAL ENABLEDELAYEDEXPANSION
cls
for /L %%a in (%bentime% -1 0) do (
set /a bentimemin=%%a/60
color f
if %%a LEQ %minlimit% color a
if %%a GEQ %maxlimit% color c
echo.
echo ************ SS-Countdown ************
echo.
echo Aktuelles Datum: 	%date%
echo Restl. Sekunden: 	%%a
echo Restl. Minuten: 	!bentimemin!
echo.
echo Zeit bis zum:		%countfolge%
timeout 1 /NOBREAK >Nul
cls
)
color f
set bentime=ABGELAUFEN
set countfolge=ABGELAUFEN
set minlimit=ABGELAUFEN
set maxlimit=ABGELAUFEN
if /i "%doaction%"=="echo." goto recount
echo.&echo Ihr Befehl wird ausgefuehrt: 
%doaction%
timeout 15 >nul
set doaction=echo.
goto recount

cls
echo.
echo ************ SS-Countdown ************
echo.
echo ERROR 700
echo Katastrophaler Fehler!
echo Programm wurde abgebrochen. 
timeout 15 >Nul
exit

:error331
mode con lines=30 cols=60
cls
echo.
echo ************ SS-Countdown ************
echo.
echo ERROR 331
echo Unbekannter Fehler!
echo Programm wurde abgebrochen. 
echo.
echo Die Restlaufzeit betraegt weniger als 0,
echo die Gruende dafuer wurden noch nicht gefunden. 
echo.
echo Problem wird so schnell wie moeglich behoben. 
timeout 15 >Nul
exit