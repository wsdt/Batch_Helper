
color a
if not defined "%version%" @echo off 
set mode=SS-Hacken %version%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
for /L %%a in (0 5 100) do (
cls
echo.
echo ************* Smart Speed PRO %version% ***************
echo.
echo Willkommen beim Hacking-Extra von Smart Speed!
echo.&echo Bitte warte. . .
echo Verbindung mit Black-Web Server wird hergestellt [%%a Prozent]
timeout 0 >Nul
)
REM Hier eventuell Reihenfolge und delims anpassen 
FOR /F "tokens=1,2,3 delims=." %%a in ('echo %date%') do set yy=%%c & set mm=%%b & set dd=%%a 
set /a "TwoDigitYearMax=2038%%1000" 
if 1%yy% LSS 200 if 1%yy% LSS 1%TwoDigitYearMax% (set yy=20%yy%) else (set yy=19%yy%) 
set /a dd=100%dd%%%100,mm=100%mm%%%100 
set /a z=14-mm,z/=12,y=yy+4800-z,m=mm+12*z-3,dow=153*m+2 
set /a dow=dow/5+dd+y*365+y/4-y/100+y/400-2472630,dow%%=7,dow+=1
If %dow% equ 1 set "WoTa=1"&set WoTa=Montag
If %dow% equ 2 set "WoTa=2"&set WoTa=Dienstag
If %dow% equ 3 set "WoTa=3"&set WoTa=Mittwoch
If %dow% equ 4 set "WoTa=4"&set WoTa=Donnerstag
If %dow% equ 5 set "WoTa=5"&set WoTa=Freitag
If %dow% equ 6 set "WoTa=6"&set WoTa=Samstag
If %dow% equ 7 set "WoTa=7"&set WoTa=Sonntag
cls
echo.
echo ************* Smart Speed PRO %version% ***************
echo.
echo Willkommen! Wir hacken deine/-n Wunschhomepage/-PC. 
echo Dieses Programm ist kein Spasstool, es funktioniert wirklich!
echo.
echo Um uns zu sichern bitten wir dich deine Volljaehrigkeit zu
echo bestaetigen und die AGB zu lesen, danke!
echo.
echo Bist du Volljaehrig (18 Jahre alt)? 
set /p volljaehrig=--- 
if /i "%volljaehrig%"=="ja" goto hackallow
if /i "%volljaehrig%"=="yes" goto hackallow
if /i "%volljaehrig%"=="1" goto hackallow
echo ERROR 743 - Du bist MINDERJAEHRIG!
timeout 10 >nul
goto exit
:hackallow
set volljaehrig=no
cls
echo.
echo ************* Smart Speed PRO %version% ***************
echo.
echo Wir bitten dich, dieses Hacking-Tool mit Bedacht zu nutzen!
echo Wenn du im naechsten Schritt die zu hackende Homepage eingibst,
echo werden alle moeglichen gaengigen Luecken gesucht und dir so
echo alle Zugangsdaten freizuschalten!
echo.
echo Dieses Programm dient offiziell nur zum wiederrausfinden der
echo Zugangsdaten der eigenen Homepage!
echo.
echo Gib die Webadresse an! SYNTAX: www.BEISPIEL.com
set /p hacksth=--- 
set hpexist=yes
ping -n 1 %hacksth% >nul || set hpexist=no
cls
echo.
echo ************* Smart Speed PRO %version% ***************
echo.
if /i "%hpexist%"=="no" (
color c
echo ERROR 404 - Folgende moegliche Gruende:
echo 1. Die angegebene Homepage existiert nicht.
echo 2. Es besteht keine Internetverbindung.
timeout 15 >Nul
color a
goto hackallow
)
echo Die Homepage reagiert auf unser Datenpaket!
echo SS-Hacking wird hochgefahren...
timeout 8 /NOBREAK >nul
set paket=0
set randommin=1&set randommax=15&set /a successful=randommin+(randommax-randommin+1)*%random%/32768
if %successful% LEQ 10 set success=ERFOLGREICH
if %successful% GEQ 11 set success=FEHLGESCHLAGEN
:schleife
cls
echo.
echo ************* Smart Speed PRO %version% ***************
echo.
echo ZIEL-URL:		%hacksth%
echo HACK-Fortschritt:	%paket% Prozent
echo.
if %paket% GEQ 95 echo Alle Daten gesammelt.&echo.&echo FTP-LogIn Panel wird heruntergeladen.&echo Wahrscheinlichkeit: 66,66 Prozent&timeout 5 /NOBREAK >nul&set /a paket=%paket%+5&goto checkpoint1
if %paket% GEQ 81 echo Username gespeichert!&echo.&echo Passwort wird per Brute Force Methode gehackt...&timeout 5 /NOBREAK >Nul&set /a paket=%paket%+5&goto checkpoint1
if %paket% GEQ 71 echo LogIn URL gespeichert!&echo.&echo Username wird ermittelt...&set /a paket=%paket%+5&timeout 5 /NOBREAK >nul&goto checkpoint1
if %paket% GEQ 61 echo Homepage Firewall wurde durchdrungen!&echo Ab jetzt machst du dich strafbar, wenn dies nicht deine HP ist.&echo.&echo LogIn URL wird ermittelt...&set /a paket=%paket%+5&timeout 5 /NOBREAK >nul&goto checkpoint1
if %paket% GEQ 31 echo Wir sind nun dabei die Firewall der Homepage zu hacken...&echo.&echo Durch diverse Abwehrmechamismen koennen abnormale Aktionen&echo an deinem PC ausgefuehrt werden. &start powershell.exe&set /a paket=%paket%+5&timeout 5 /NOBREAK >nul&goto checkpoint1
if %paket% GEQ 21 tracert %hacksth%&set /a paket=%paket%+5&goto checkpoint1
if %paket% GEQ 1 ping -n %paket% %hacksth%&set /a paket=%paket%+5&goto checkpoint1
if %paket% EQU 0 ping -n 5 %hacksth%&set /a paket=%paket%+5&goto checkpoint1
if %paket% LSS 0 echo UNBEKANNTER FEHLER 481&echo Bitte sofort melden!&timeout 8 >nul&goto exit
:checkpoint1
timeout 3 /NOBREAK >nul
if "%paket%"=="100" goto fertighack
goto schleife
:fertighack
cls
echo.
echo ************* Smart Speed PRO %version% ***************
echo.
echo ZIEL-URL:		%hacksth%
echo HACK-Fortschritt:	%paket% Prozent
echo.
if /i "%success%"=="FEHLGESCHLAGEN" (
color c
echo ERROR 1098
echo LogIn Panel konnte nicht heruntergeladen werden!
echo Anfrage wurde vom Administrator der Homepage geblockt. 
echo.&echo HACK fehlgeschlagen. Versuche es erneut.
timeout 17 /NOBREAK >nul
color a
goto hackallow
)
if /i "%success%"=="ERFOLGREICH" (
echo HACK ERFOLGREICH!
echo.
echo USERNAME: user%random%%date:~0,2%%time:~3,2%
echo PASSWORD: %time:~1,2%%random:~1,2%%random%%date:~3,2%
echo.
echo FTP-Login Panel wird geladen und geoeffnet...
echo Dies kann eine Weile dauern!
set browser=0
timeout 10 /NOBREAK >nul
start "chrome.exe" "AdditionalData\hack_panel.html" || set /a browser=%browser%+1&goto iexplore
goto hpause
:iexplore
start "iexplore.exe" "AdditionalData\hack_panel.html" || set /a browser=%browser%+1&goto firefox
goto hpause
:firefox
start "firefox.exe" "AdditionalData\hack_panel.html" || set /a browser=%browser%+1
if "%browser%"=="3" echo ERROR 833 - Kein unterstuetzter Browser installiert!
:hpause
pause >nul
goto exit
)

:exit
cd ..