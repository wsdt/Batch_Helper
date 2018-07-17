@echo off
set versionkal=1.0
SETLOCAL ENABLEDELAYEDEXPANSION
cls
title SMART SPEED - Kalender %versionkal%
set mode=SS-Kalender %versionkal%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
:sskalender
color F
cls
echo.
echo *************** Kalender Assistent ***************
echo.
echo Um was geht es?
echo * Test (1) * Geburtstag (2) * Schularbeit (3) * Event (4) * 
echo * Alle anzeigen (5) * Beenden (0) *
set mode=FEHLERHAFTE_BESTIMMUNG
set /p mode=--- 
cls
if /i "%mode%"=="0" goto exit
if /i "%mode%"=="exit" goto exit
if /i "%mode%"=="beenden" goto exit
if /i "%mode%"=="test" set art=test&set id=1&goto kalender
if /i "%mode%"=="1" set art=test&set id=1&goto kalender
if /i "%mode%"=="tests" set art=test&set id=1&goto kalender
if /i "%mode%"=="geburtstag" set art=geburtstag&set id=2&goto kalender
if /i "%mode%"=="2" set art=geburtstag&set id=2&goto kalender
if /i "%mode%"=="geb" set art=geburtstag&set id=2&goto kalender
if /i "%mode%"=="geburtstage" set art=geburtstag&set id=2&goto kalender
if /i "%mode%"=="sa" set art=sa&set id=3&goto kalender
if /i "%mode%"=="3" set art=sa&set id=3&goto kalender
if /i "%mode%"=="sas" set art=sa&set id=3&goto kalender
if /i "%mode%"=="schularbeit" set art=sa&set id=3&goto kalender
if /i "%mode%"=="schularbeiten" set art=sa&set id=3&goto kalender
if /i "%mode%"=="event" set art=event&set id=4&goto kalender
if /i "%mode%"=="4" set art=event&set id=4&goto kalender
if /i "%mode%"=="events" set art=event&set id=4&goto kalender
if /i "%mode%"=="party" set art=event&set id=4&goto kalender
if /i "%mode%"=="veranstaltung" set art=event&set id=4&goto kalender
if /i "%mode%"=="5" goto showall
if /i "%mode%"=="alle" goto showall
if /i "%mode%"=="anzeigen" goto showall
if /i "%mode%"=="show" goto showall
goto error404

:kalender
echo.
echo *************** Kalender Assistent ***************
echo.
echo * Eintrag erstellen (1) * Eintrag loeschen (2) *
echo * Eintrag editieren (3) * Eintraege anzeigen (4) *
echo * Beenden (0)
set /p kalender=--- 
if /i "%kalender%"=="0" goto exit
if /i "%kalender%"=="exit" goto exit
if /i "%kalender%"=="beenden" goto exit
if /i "%kalender%"=="1" goto create
if /i "%kalender%"=="erstellen" goto create
if /i "%kalender%"=="create" goto create
if /i "%kalender%"=="2" goto delete
if /i "%kalender%"=="delete" goto delete
if /i "%kalender%"=="loeschen" goto delete
if /i "%kalender%"=="3" goto edit
if /i "%kalender%"=="edit" goto edit
if /i "%kalender%"=="editieren" goto edit
if /i "%kalender%"=="bearbeiten" goto edit
if /i "%kalender%"=="show" goto show
if /i "%kalender%"=="4" goto show
if /i "%kalender%"=="zeigen" goto show
if /i "%kalender%"=="anzeigen" goto show
goto error404

:edit
cls
echo.
echo *************** Editieren ***************
echo.
echo #BAUSTELLE 0001
echo Dieser Bereich steht noch unter Konstruktion. 
echo Das naechste UPDATE beinhaltet diesen Programmteil. 
echo.
echo Programmdateien koennen manuell bearbeitet werden. 
timeout 30 >nul
echo Welcher Eintrag soll bearbeitet werden? [ID]
set /p editid=--- 
if not exist "%id%_%art%_%editid%.bat" echo ERROR 404: Eintrag existiert nicht...&timeout 15 >Nul&goto edit
if exist "%id%_%art%_%editid%.bat" del "%id%_%art%_%editid%.bat"
REM Achtung! Stoffdateien beruecksichtigen. Art ueberprufen. 
goto sskalender

:show
cls
echo.
echo *************** Anzeigen ***************
echo.
echo Es werden die ausgewaehlten Eintraege gelistet: 
set pruefung=0
if /i "%id%"=="3" set pruefung=ja
if /i "%id%"=="1" set pruefung=ja
for /L %%c in (1 1 15) do if exist "%id%_%art%_%%c.bat" call "%id%_%art%_%%c.bat"&if /i "%pruefung%"=="ja" if exist "%id%_%art%_%%c_stoff.bat" call "%id%_%art%_%%c_stoff.bat"&echo.
pause >nul
goto sskalender

:delete
cls
echo.
echo *************** Loeschen ***************
echo.
echo Welchen Eintrag moechtest du loeschen?
for /L %%b in (1 1 15) do if exist "%id%_%art%_%%b.bat" call "%id%_%art%_%%b.bat"
echo.
echo Gib diese ID an: [%id%_%art%_ID]
set /p delid=--- 
if not exist "%id%_%art%_%delid%.bat" echo ERROR 404: Eintrag existiert nicht!
if exist "%id%_%art%_%delid%.bat" del "%id%_%art%_%delid%.bat"&if not exist "%id%_%art%_%delid%.bat" echo # Eintrag erfolgreich geloescht!
if /i "%id%"=="1" goto delstoff
if /i "%id%"=="3" goto delstoff
:sskalenderdelwait
timeout 10 >nul
goto sskalender

:delstoff
if exist "%id%_%art%_%delid%_stoff.bat" del "%id%_%art%_%delid%_stoff.bat"&if not exist "%id%_%art%_%delid%_stoff.bat" echo # Stoffdatei erfolgreich geloescht!
goto sskalenderdelwait

:create
set datum=FEHLERHAFTE_BESTIMMUNG
cls
echo.
echo *************** Eintragen ***************
echo.
echo Wann ist der Eintrag? [dd.mm.jjjj] [UNBEKANNT]
set /p datum=--- 
set /a maxyear=%date:~6,4%+5
set createerror=no
if /i "%datum%"=="UNBEKANNT" goto dateunkown
if not %datum:~2,1% EQU . echo ERROR 1295: Falsche Syntax! [%datum:~2,1%]&set createerror=yes
if not %datum:~5,1% EQU . echo ERROR 1296: Falsche Syntax! [%datum:~2,1%]&set createerror=yes
if %datum:~0,2% LEQ 0 echo ERROR 1297: Dieser Tag existiert nicht! [%datum:~0,2%]&set createerror=yes
if %datum:~0,2% GEQ 32 echo ERROR 1298: Dieser Tag existiert nicht! [%datum:~0,2%]&set createerror=yes
if %datum:~3,2% LEQ 0 echo ERROR 1299: Dieser Monat existiert nicht! [%datum:~3,2%]&set createerror=yes
if %datum:~3,2% GEQ 13 echo ERROR 1300: Dieser Monat existiert nicht! [%datum:~3,2%]&set createerror=yes
if not "%id%"=="2" if %datum:~6,4% LSS %date:~6,4% echo ERROR 1301: Dieses Jahr ist bereits vergangen! [%datum:~6,4%]&set createerror=yes
if not "%id%"=="2" if %datum:~3,2% LSS %date:~3,2% echo ERROR 1302: Dieser Monat ist bereits vergangen! [%datum:~3,2%]&set createerror=yes
if %datum:~6,4% LEQ 1900  echo ERROR 1303: Dieses Jahr liegt zu weit in der Vergangenheit! [%datum:~6,4%]&set createerror=yes
if %datum:~6,4% GEQ %maxyear% echo ERROR 1304: Dieses Jahr liegt zu weit in der Zukunft! [%datum:~6,4%]&set createerror=yes
if /i "%createerror%"=="YES" timeout 25 >nul&goto create
:dateunkown
echo.
echo Genauere Infos eintragen: [Fach, Ort, Uhrzeit, Name]
set /p info=--- 
echo.
for /L %%a in (1 1 15) do if not exist "%id%_%art%_%%a.bat" echo set dna=[%datum%] %info% (%%a) >> "%id%_%art%_%%a.bat"&echo echo %%dna%% >> "%id%_%art%_%%a.bat"&if exist "%id%_%art%_%%a.bat" echo # Eintrag erfolgreich eingetragen!&set creatednr=%%a&goto crsskalwait
:createtolearn
echo.
echo Geben Sie einen Lernstoff an: 
set /p tolearn=--- 
if not exist "%id%_%art%_%creatednr%_stoff.bat" echo echo Lernstoff: %tolearn% >> "%id%_%art%_%creatednr%_stoff.bat"&if exist "%id%_%art%_%creatednr%_stoff.bat" echo # Stoff erfolgreich eingetragen!
timeout 5 >Nul
goto sskalender
:crsskalwait
if /i "%id%"=="1" goto createtolearn
if /i "%id%"=="3" goto createtolearn
timeout 5 >nul
goto sskalender

:error404
cls
echo.
echo *************** ERROR 404 ***************
echo.
echo Auswahl existiert leider nicht!
echo SMART SPEED wird fortgesetzt . . .
timeout 15 >nul
goto sskalender

:showall
cls
echo.
echo *************** Alle Anzeigen ***************
echo.
echo ~~~~ Tests: 
for /L %%a in (1 1 15) do if exist "1_test_%%a.bat" call "1_test_%%a.bat"
echo.
echo ~~~~ Geburtstage:
for /L %%b in (1 1 15) do if exist "2_geburtstag_%%b.bat" call "2_geburtstag_%%b.bat"
echo.
echo ~~~~ Schularbeiten:
for /L %%c in (1 1 15) do if exist "3_sa_%%c.bat" call "3_sa_%%c.bat"
echo.
echo ~~~~ Veranstaltungen: 
for /L %%d in (1 1 15) do if exist "4_event_%%d.bat" call "4_event_%%d.bat"
pause >Nul
goto sskalender

:exit
cd ..