@echo off
REM Variert der Stundenplan ueber mehrere Wochen? Wenn ja dann Anzahl der Wochen eingeben z.B. 2, sonst 1
set wochen=1
set hour=50
set pause=5
set bigpause=15

REM Deklaration
set Amopausenmin=0
set Amodauermin=0


REM Wochentagpruefung
REM Hier eventuell Reihenfolge und delims anpassen 
FOR /F "tokens=1,2,3 delims=." %%a in ('echo %date%') do set yy=%%c & set mm=%%b & set dd=%%a 
set /a "TwoDigitYearMax=2038%%1000" 
if 1%yy% LSS 200 if 1%yy% LSS 1%TwoDigitYearMax% (set yy=20%yy%) else (set yy=19%yy%) 
set /a dd=100%dd%%%100,mm=100%mm%%%100 
set /a z=14-mm,z/=12,y=yy+4800-z,m=mm+12*z-3,dow=153*m+2 
set /a dow=dow/5+dd+y*365+y/4-y/100+y/400-2472630,dow%%=7,dow+=1
If %dow% equ 1 set "WoTa=1"&REM Montag
If %dow% equ 2 set "WoTa=2"&REM Dienstag
If %dow% equ 3 set "WoTa=3"&REM Mittwoch
If %dow% equ 4 set "WoTa=4"&REM Donnerstag
If %dow% equ 5 set "WoTa=5"&REM Freitag
If %dow% equ 6 set "WoTa=6"&REM Samstag
If %dow% equ 7 set "WoTa=7"&REM Sonntag


REM Wochenpruefung; welche Woche ist?
REM Von einem fixen Datum rechnen vl
REM Datum 18.1.2016 - 22.1.2016 = Woche A/1
REM Datum 25.1.2016 - 29.1.2016 = Woche B/2






REM Allgemeines Ende
set Amo13=*Schulende*


:: Alle Roomchange Vars zuruecksetzen
SETLOCAL ENABLEDELAYEDEXPANSION
for /L %%a in (1 1 12) do (
set Amo%%achange=no
)
ENDLOCAL & set "Amo1change=%Amo1change%" & set "Amo2change=%Amo2change%" & set "Amo3change=%Amo3change%" & set "Amo4change=%Amo4change%" & set "Amo5change=%Amo5change%" & set "Amo6change=%Amo6change%" & set "Amo7change=%Amo7change%" & set "Amo8change=%Amo8change%" & set "Amo9change=%Amo9change%" & set "Amo10change=%Amo10change%" & set "Amo11change=%Amo11change%" & set "Amo12change=%Amo12change%" & set "Amo13=%Amo13%"

REM Woche 1
:woche_eins
if %WoTa% equ 1 (
REM Montag 1
set Amodauer=11:45
set Amodauerh=4
set Amo1=Mathematik
set Amo2=Italienisch
set Amo3=Deutsch
set Amo4=Englisch&set Amo4change=yes
set Amo5=*Schulende*
set Amo6=*Schulende*
set Amo7=*Schulende*
set Amo8=*Schulende*
set Amo9=*Schulende*
set Amo10=*Schulende*
set Amo11=*Schulende*
set Amo12=*Schulende*
)
if %WoTa% equ 2 (
REM Dienstag 1
set Amodauer=16:10
set Amodauerh=9
set Amo1=Englisch
set Amo2=PMPA
set Amo3=Italienisch
set Amo4=Rechnungswesen
set Amo5=IWK_Geografie
set Amo6=IWK_Geografie&set Amo6change=yes
set Amo7=*Mittagspause*&set Amo7change=yes
set Amo8=Volkswirtschaft
set Amo9=Volkswirtschaft&set Amo9change=yes
set Amo10=*Schulende*
set Amo11=*Schulende*
set Amo12=*Schulende*
)
if %WoTa% equ 3 (
REM Mittwoch 1
set Amodauer=11:45
set Amodauerh=4
set Amo1=Biologie
set Amo2=Religion
set Amo3=Deutsch
set Amo4=Betriebswirtschaft&set Amo4change=yes
set Amo5=*Schulende*
set Amo6=*Schulende*
set Amo7=*Schulende*
set Amo8=*Schulende*
set Amo9=*Schulende*
set Amo10=*Schulende*
set Amo11=*Schulende*
set Amo12=*Schulende*
)
if %WoTa% equ 4 (
REM Donnerstag 1
set Amodauer=16:10
set Amodauerh=9
set Amo1=Religion
set Amo2=Mathematik&set Amo2change=yes
set Amo3=Programmieren
set Amo4=Programmieren&set Amo4change=yes
set Amo5=Indesign_Publisher
set Amo6=Indesign_Publisher&set Amo6change=yes
set Amo7=*Mittagspause*&set Amo7change=yes
set Amo8=Turnen
set Amo9=Turnen&set Amo9change=yes
set Amo10=*Schulende*
set Amo11=*Schulende*
set Amo12=*Schulende*
)
if %WoTa% equ 5 (
REM Freitag 1
set Amodauer=13:35
set Amodauerh=6
set Amo1=Rechnungswesen
set Amo2=Betriebswirtschaft
set Amo3=Volkswirtschaft
set Amo4=Deutsch
set Amo5=Englisch
set Amo6=Biologie&set Amo6change=yes
set Amo7=*Schulende*
set Amo8=*Schulende*
set Amo9=*Schulende*
set Amo10=*Schulende*
set Amo11=*Schulende*
set Amo12=*Schulende*
)
goto count_start
REM ------------------------------------------------------------------------------
:woche_zwei
REM Woche 2
if %WoTa% equ 1 (
REM Montag 2
set Amodauer=13:35
set Amodauerh=6
set Amo1=Mathematik
set Amo2=Italienisch
set Amo3=Deutsch
set Amo4=Englisch&set Amo4change=yes
set Amo5=Case_Studies
set Amo6=Case_Studies&set Amo6change=yes
set Amo7=*Schulende*
set Amo8=*Schulende*
set Amo9=*Schulende*
set Amo10=*Schulende*
set Amo11=*Schulende*
set Amo12=*Schulende*
)
if %WoTa% equ 2 (
REM Dienstag 2
set Amodauer=13:35
set Amodauerh=6
set Amo1=Englisch
set Amo2=PMPA
set Amo3=Italienisch
set Amo4=Rechnungswesen
set Amo5=IWK_Geschichte
set Amo6=IWK_Geschichte&set Amo6change=yes
set Amo7=*Schulende*
set Amo8=*Schulende*
set Amo9=*Schulende*
set Amo10=*Schulende*
set Amo11=*Schulende*
set Amo12=*Schulende*
)
if %WoTa% equ 3 (
REM Mittwoch 2
set Amodauer=13:35
set Amodauerh=6
set Amo1=Biologie
set Amo2=Religion
set Amo3=Deutsch
set Amo4=Betriebswirtschaft&set Amo4change=yes
set Amo5=*Schulende*
set Amo6=*Schulende*
set Amo7=*Schulende*
set Amo8=*Schulende*
set Amo9=*Schulende*
set Amo10=*Schulende*
set Amo11=*Schulende*
set Amo12=*Schulende*
)
if %WoTa% equ 4 (
REM Donnerstag 2
set Amodauer=13:35
set Amodauerh=6
set Amo1=Religion
set Amo2=Mathematik&set Amo2change=yes
set Amo3=Programmieren
set Amo4=Programmieren&set Amo4change=yes
set Amo5=Wirtschaftsinformatik
set Amo6=Wirtschaftsinformatik&set Amo6change=yes
set Amo7=*Schulende*
set Amo8=*Schulende*
set Amo9=*Schulende*
set Amo10=*Schulende*
set Amo11=*Schulende*
set Amo12=*Schulende*
)
if %WoTa% equ 5 (
REM Freitag 2
set Amodauer=13:35
set Amodauerh=6
set Amo1=Rechnungswesen
set Amo2=Betriebswirtschaft
set Amo3=Volkswirtschaft
set Amo4=Deutsch
set Amo5=Englisch
set Amo6=Biologie&set Amo6change=yes
set Amo7=*Schulende*
set Amo8=*Schulende*
set Amo9=*Schulende*
set Amo10=*Schulende*
set Amo11=*Schulende*
set Amo12=*Schulende*
)
rem goto count_start
:count_start
if /i %Amodauerh% LEQ 0 echo ERROR: NULL oder WENIGER Stunden.&timeout 15 >nul&exit
if /i %Amodauerh% GTR 3 set /a Amopausenmin=(%Amodauerh%-2)*5+15
if /i %Amodauerh% LEQ 3 set /a Amopausenmin=(%Amodauerh%-1)*5
set /a Amodauermin=(%Amodauerh%*50)+%Amopausenmin%
REM Mittagspause nicht zu berücksichtigen, da als 'normale' Stunde behandelt. 

REM Nicht mit 12 rechnen, da bei WoTa-Errechnung nur 1-7, NACHSTELLEN
if %WoTa% GEQ 6 echo ERROR 8006: Wochentag nicht gefunden.&timeout 15 >Nul&exit
if %WoTa% LEQ 0 echo ERROR 8006: Wochentag nicht gefunden.&timeout 15 >Nul&exit

REM Aktivieren wenn Setlocal vorher
::set "Amodauer=%Amodauer%" 
::set "Amodauerh=%Amodauerh%"
::set "Amo1=%Amo1%"
::set "Amo2=%Amo2%"
::set "Amo3=%Amo3%"
::set "Amo4=%Amo4%"
::set "Amo5=%Amo5%"
::set "Amo6=%Amo6%"
::set "Amo7=%Amo7%"
::set "Amo8=%Amo8%"
::set "Amo9=%Amo9%"
::set "Amo10=%Amo10%"
::set "Amo11=%Amo11%"
::set "Amo12=%Amo12%"
::set "Amo13=%Amo13%"


REM Zahlen immer mit 'set /a var=5' deklarieren