:calc997
set mode=SS-Countdown %countdownversion%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
if /i "%securestatus%"=="on" title SS-Countdown %countdownversion% - SECURITY GUARD ON
if /i "%securestatus%"=="off" title SS-Countdown %countdownversion% - SECURITY OFF
for /L %%a in (0 10 100) do (
cls
echo.
echo ************* Smart Speed PRO %version% ***************
echo.
echo Willkommen beim Countdown-Extra von Smart Speed!
echo.&echo Bitte warte. . .
echo Stundenplan wird geladen [%%a Prozent]
timeout 0 >Nul
)


:calculate

REM Stundenplan aufrufen
if exist "Extras\3_Countdown_Stundenplan.bat" call "Extras\3_Countdown_Stundenplan.bat"
if not exist "Extras\3_Countdown_Stundenplan.bat" echo ERROR: Stundenplan not found.&timeout 15 >nul&exit

mode con lines=11 cols=50

REM SPART TEXT
set roomchange=no

if %WoTa% equ 6 (
cls&echo.&echo ************ SS-Countdown ************&echo.&echo Am Samstag ist keine Schule!&echo Geniesse dein Wochenende!&timeout 15 >nul&exit
)
if %WoTa% equ 7 (
cls&echo.&echo ************ SS-Countdown ************&echo.&echo Am Sonntag ist keine Schule!&echo Geniesse dein Wochenende!&timeout 15 >nul&exit
)
if %time:~0,2% LSS 8 cls&echo.&echo ************ SS-Countdown ************&echo.&echo Aktuelle Uhrzeit: %time:~0,5%&echo Die Schule faengt erst spaeter an!&timeout 15 >nul&goto calc997

REM SPART ZEILEN:
cls&echo.&echo ************ SS-Countdown ************&echo.




REM Stundenplan uebernehmen
set schulende=%Amodauer%
set hours=%Amodauerh%
REM Wie viele Min bis Schulende inkl Pausen
set toend=%Amodauermin%

if %time:~0,2% GEQ %Amodauer:~0,2% if %time:~3,2% GEQ %Amodauer:~3,2% goto finished
if %time:~0,2% EQU 8 if %time:~3,2% LEQ 50 set hour=1&set fach=%Amo1%&set limit2=0&set nextfach=%Amo2%&set limit=50&goto countdowntimer
if %time:~0,2% EQU 8 if %time:~3,2% LEQ 55 set hour=1-5&set fach=PAUSE&set limit2=0&set nextfach=%Amo2%&set limit=55&goto countdowntimer
if %time:~0,2% EQU 8 if %time:~3,2% LEQ 60 set hour=2&set fach=%Amo2%&set limit2=45&set limit=60&set nextfach=%Amo3%&goto countdowntimer
if %time:~0,2% EQU 9 if %time:~3,2% LEQ 45 set hour=2&set fach=%Amo2%&set limit2=0&set limit=45&set nextfach=%Amo3%&goto countdowntimer
if %time:~0,2% EQU 9 if %time:~3,2% LEQ 50 set hour=2-5&set fach=PAUSE&set limit2=0&set limit=50&set nextfach=%Amo3%&goto countdowntimer
if %time:~0,2% EQU 9 if %time:~3,2% LEQ 60 set hour=3&set fach=%Amo3%&set limit2=40&set limit=60&set nextfach=%Amo4%&goto countdowntimer
if %time:~0,2% EQU 10 if %time:~3,2% LEQ 40 set hour=3&set fach=%Amo3%&set limit2=0&set limit=40&set nextfach=%Amo4%&goto countdowntimer
if %time:~0,2% EQU 10 if %time:~3,2% LEQ 55 set hour=3-5&set fach=GROSSE_PAUSE&set limit2=0&set limit=55&set nextfach=%Amo4%&goto countdowntimer
if %time:~0,2% EQU 10 if %time:~3,2% LEQ 60 set hour=4&set fach=%Amo4%&set limit2=45&set limit=60&set nextfach=%Amo5%&goto countdowntimer
if %time:~0,2% EQU 11 if %time:~3,2% LEQ 45 set hour=4&set fach=%Amo4%&set limit2=0&set limit=45&set nextfach=%Amo5%&goto countdowntimer
if %time:~0,2% EQU 11 if %time:~3,2% LEQ 50 set hour=4-5&set fach=PAUSE&set limit=50&set limit2=0&set nextfach=%Amo5%&goto countdowntimer
if %time:~0,2% EQU 11 if %time:~3,2% LEQ 60 set hour=5&set fach=%Amo5%&set limit=60&set limit2=40&set nextfach=%Amo6%&goto countdowntimer
if %time:~0,2% EQU 12 if %time:~3,2% LEQ 40 set hour=5&set fach=%Amo5%&set limit=40&set limit2=0&set nextfach=%Amo6%&goto countdowntimer
if %time:~0,2% EQU 12 if %time:~3,2% LEQ 45 set hour=5-5&set fach=PAUSE&set limit=45&set limit2=0&set nextfach=%Amo6%&goto countdowntimer
if %time:~0,2% EQU 12 if %time:~3,2% LEQ 60 set hour=6&set fach=%Amo6%&set limit=60&set limit2=35&set nextfach=%Amo7%&goto countdowntimer
if %time:~0,2% EQU 13 if %time:~3,2% LEQ 35 set hour=6&set fach=%Amo6%&set limit=35&set limit2=0&set nextfach=%Amo7%&goto countdowntimer
if %time:~0,2% EQU 13 if %time:~3,2% LEQ 40 set hour=6-5&set fach=PAUSE&set limit=40&set limit2=0&set nextfach=%Amo7%&goto countdowntimer
if %time:~0,2% EQU 13 if %time:~3,2% LEQ 60 set hour=7&set fach=%Amo7%&set limit=60&set limit2=25&set nextfach=%Amo8%&goto countdowntimer
if %time:~0,2% EQU 14 if %time:~3,2% LEQ 20 set hour=7&set fach=%Amo7%&set limit=25&set limit2=0&set nextfach=%Amo8%&goto countdowntimer
if %time:~0,2% EQU 14 if %time:~3,2% LEQ 25 set hour=7-5&set fach=PAUSE&set limit=25&set limit2=0&set nextfach=%Amo8%&goto countdowntimer
if %time:~0,2% EQU 14 if %time:~3,2% LEQ 60 set hour=8&set fach=%Amo8%&set limit=60&set limit2=15&set nextfach=%Amo9%&goto countdowntimer
if %time:~0,2% EQU 15 if %time:~3,2% LEQ 15 set hour=8&set fach=%Amo8%&set limit=15&set limit2=0&set nextfach=%Amo9%&goto countdowntimer
if %time:~0,2% EQU 15 if %time:~3,2% LEQ 20 set hour=8-5&set fach=PAUSE&set limit=20&set limit2=0&set nextfach=%Amo9%&goto countdowntimer
if %time:~0,2% EQU 15 if %time:~3,2% LEQ 60 set hour=9&set fach=%Amo9%&set limit=60&set limit2=10&set nextfach=%Amo10%&goto countdowntimer
if %time:~0,2% EQU 16 if %time:~3,2% LEQ 10 set hour=9&set fach=%Amo9%&set limit=10&set limit2=0&set nextfach=%Amo10%&goto countdowntimer
if %time:~0,2% EQU 16 if %time:~3,2% LEQ 15 set hour=9-5&set fach=PAUSE&set limit=15&set limit2=0&set nextfach=%Amo10%&goto countdowntimer
if %time:~0,2% EQU 16 if %time:~3,2% LEQ 60 set hour=10&set fach=%Amo10%&set limit=60&set limit2=5&set nextfach=%Amo11%&goto countdowntimer
if %time:~0,2% EQU 17 if %time:~3,2% LEQ 5 set hour=10&set fach=%Amo10%&set limit=5&set limit2=0&set nextfach=%Amo11%&goto countdowntimer
if %time:~0,2% EQU 17 if %time:~3,2% LEQ 10 set hour=10-5&set fach=PAUSE&set limit=10&set limit2=0&set nextfach=%Amo11%&goto countdowntimer
if %time:~0,2% EQU 17 if %time:~3,2% LEQ 60 set hour=11&set fach=%Amo11%&set limit=60&set limit2=1&set nextfach=%Amo12%&goto countdowntimer
if %time:~0,2% EQU 18 if %time:~3,2% LSS 1 set hour=11&set fach=%Amo11%&set limit=1&set limit2=0&set nextfach=%Amo12%&goto countdowntimer
if %time:~0,2% EQU 18 if %time:~3,2% LEQ 5 set hour=11-5&set fach=PAUSE&set limit=5&set limit2=0&set nextfach=%Amo12%&goto countdowntimer
if %time:~0,2% EQU 18 if %time:~3,2% LEQ 55 set hour=12&set fach=%Amo12%&set limit=55&set limit2=0&set nextfach=%Amo13%&goto countdowntimer
set fach=FEHLER_bei_Fachscan&goto countdowntimer
echo ERROR 8001: Sprungmarke bei Fachbestimmung uebersprungen.&timeout 15 >nul&exit



:finished
echo Die Schule ist bereits vorbei!
echo Versuche es morgen nochmal.
timeout 15 >nul
exit


:countdowntimer
set /a targetsec=((%limit%+%limit2%)*60)-((%time:~3,2%*60)+%time:~6,2%)
set /a targetminut=%targetsec%/60
set /a halfhours=%hours%/2
set nochhours=Erst
if /i %hour:~0,2% GTR %halfhours:~0,2% set nochhours=Bereits
set /a gesamtprozent=(%hour:~0,1%*10000)/%hours:~0,1%
set /a caprozent=(%hour:~0,1%*100)/%hours:~0,1%
set teilwert=3000
if /i "%fach%"=="Pause" set teilwert=300
if /i "%fach%"=="Grosse Pause" set teilwert=900
set /a closeprozent=100-((%targetsec%*100)/%teilwert%)

REM Fehlerquellenpruefung
set error1001p=no
set error1001m=ERROR 1001: Variable abgelaufen
if /i "%fach%"=="ABGELAUFEN" echo %error1001m% #FACH&set error1001p=yes
if /i "%targetminut%"=="ABGELAUFEN" echo %error1001m% #TARGETMINUT&set error1001p=yes
if /i "%schulende%"=="ABGELAUFEN" echo %error1001m% #SCHULENDE&set error1001p=yes
if /i "%nextfach%"=="ABGELAUFEN" echo %error1001m% #NEXTFACH&set error1001p=yes
if /i "%error1001p%"=="yes" echo.&echo Programm angehalten * Programm wird neugestartet...&timeout /NOBREAK 10 >Nul&goto calculate

REM SECURITY STARTEN
if /i "%securestatus%"=="on" if /i "%fach%"=="PAUSE" set securebreak=yes&start "cmd.exe" "6_Security.lnk"
if /i "%securestatus%"=="on" if /i "%fach%"=="GROSSE_PAUSE" set securebreak=yes&start "cmd.exe" "6_Security.lnk"
if /i "%securestatus%"=="on" if /i "%fach%"=="*MITTAGSPAUSE*" set securebreak=yes&start "cmd.exe" "6_Security.lnk"

REM DOPPELSTUNDE PRUEFUNG
set targetsec2=0
set doppelcount=nein
set targetminut2=0
if /i "%fach%"=="%nextfach%" set /a targetsec2=%targetsec%+3000&set doppelcount=JA

REM Schulende Countdown
set bigbreak=0
set mittagsbreak=0
REM if %hours% GTR 6 set mittagsbreak=2700
REM if %hour% GTR 3 set bigbreak=600
set /a paussec=(%hours%*300+600)-((%hour%-1)*300+%bigbreak%)
set /a countend=(%hours%-%hour%)*3000+%targetsec%+%paussec%+%mittagsbreak%-900

SETLOCAL ENABLEDELAYEDEXPANSION
::Roomchange Variablen von Stundenplan nach bev. Raumwechsel pruefen
for /L %%z in (1 1 12) do (
	if /i %hour:~0,1% equ %%z set roomchange=!Amo%%zchange!
	)
	ENDLOCAL & set "roomchange=%roomchange%"

SETLOCAL ENABLEDELAYEDEXPANSION
for /L %%a in (%targetsec% -1 0) do (
cls
set /a targetminut=%%a/60
if /i "%doppelcount%"=="JA" set /a targetminut2=!targetsec2!/60
set /a countminend=!countend!/60
REM FORMEL: set /a closeprozent=100-((%%a*100)/%teilwert%)
set /a prozent1=%%a*100
REM Nicht benötigt: set /a teilwert=!limit!+!limit2!
REM Nicht benötigt: set /a teilwert=!teilwert!*60
set /a prozent2=!prozent1!/!teilwert!
set /a closeprozent=100-!prozent2!
if %%a LSS 0 echo.&echo ERROR 5001: Die Restlaufzeit weniger als 0 s&echo SS-Countdown wird neugestartet.&timeout 15 >Nul&goto calc997
if %targetsec2% LSS 0 echo.&echo ERROR 5002: Die Restlaufzeit weniger als 0 s&echo SS-Countdown wird neugestartet.&timeout 15 >Nul&goto calc997
color f
if %%a LEQ 300 color a
if /i "%fach%"=="PAUSE" set countend=ND&set countminend=ND&color f&if %%a LEQ 60 color c
if /i "%fach%"=="PAUSE" color f&if %%a GEQ 230 color a
if /i "%fach%"=="GROSSE_PAUSE" set countend=ND&set countminend=ND&color f&if %%a LEQ 180 color c
if /i "%fach%"=="GROSSE_PAUSE" color f&if %%a GEQ 780 color a
if %%a GEQ 2700 color c

if %%a LEQ 600 if /i "%roomchange%"=="yes" mode con lines=13 cols=50&set changingroom=~ ACHTUNG: Raumwechsel steht bevor.&set echo1=echo.&set echo2=echo
echo.
echo ************ SS-Countdown ************
echo.
echo Aktuelles Fach: 	%fach%
echo Restl. Sekunden: 	%%a / !targetsec2! / !countend! s
echo Restl. Minuten: 	!targetminut! / !targetminut2! / !countminend! m
echo.
echo Schulende: 		%schulende%
echo Naechstes Fach: 	%nextfach%
echo %nochhours% %hour% von %hours% h. 	!closeprozent! / 100 Prozent
!echo1!
!echo2! !changingroom!
timeout 1 /NOBREAK >Nul
if /i "%doppelcount%"=="JA" set /a targetsec2=!targetsec2!-1
set /a countend=!countend!-1
::Funktioniert, nur nicht notwendig. 
::if "%hour%"=="%hours%" if "%%a"=="6" start sndrec32.exe /embedding /play "C:\Users\Kevin\Desktop\Smart Speed\Extras\Sounds\SS-Countdown_5Sec.wav" >Nul
::if "%hour%"=="%hours%" if "%%a"=="0" taskkill /f /im sndrec32.exe /t >Nul
)
color f
for /L %%b in (61 -1 0) do (
cls
echo.
echo ************ SS-Countdown ************
echo.
echo Fach nach Pause: 	%nextfach%
echo Restl. Sekunden: 	%%b
echo.
echo Schulende: 		%schulende%
echo Naechstes Fach: 	Nach Neustart verfuegbar!
echo.
echo SS-COUNTDOWN wird neugestartet. . .
timeout 1 /NOBREAK >Nul
)

ENDLOCAL
set fach=ABGELAUFEN
set targetminut=ABGELAUFEN
set schulende=ABGELAUFEN
set nextfach=ABGELAUFEN
set echo1=
set echo2=
set changingroom=
goto calculate

echo ERROR 8007: Sprungmarke 'calculate' uebersprungen.&timeout 15 >Nul&exit
