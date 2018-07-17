

@echo off
Setlocal EnableDelayedExpansion
set version=4.0
title MyRobot %version% - Social Edition
set mode=SS-PRO MyRobot %version% - Social Edition
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
:start
cls
REM Definiere Design
set design=color 8F
if not exist MyRobot_Color.bat echo %design%>> MyRobot_Color.bat
if exist MyRobot_Color.bat call MyRobot_Color.bat
if not exist MyRobot_Color.bat echo ERROR 001: Creating Design-File aborted.&%design%&timeout 10 >nul
if not exist "Users\default.bat" echo REM Standard-Profildatei >> "Users\default.bat"
REM Definiere Fenstergroesse
mode con lines=30 cols=62
:attention
cls
echo.
echo *************** MyRobot %version% ***************
echo.
echo Willkommen bei MyRobot - Social Edition!
echo.
echo Dieses Programm hat eine aehnliche Funktionsweise, 
echo wie Facebook, hauptsaechlich zum Chatten mit nicht 
echo reellen Personen. 
echo.
echo Der Sinn is einfach aber auch nicht: 
echo Kann dieses Programm unsere naechsten Fragen vorhersehen?
echo Es werden die wahrscheinlichsten Aussagen ausgewertet. 
echo Sind wir einfuehlsam genug um einen laengeren Chat mit 
echo einem Simulator wie diesem zu fuehren?
echo.
echo Bist du eingeloggt und hast dein Profil angelegt, dann
echo kannst du eine von 3 vorangelegten Standardprofilen 
echo anschreiben.  
echo.
echo Jedes Profil hat seine eigenen Ansichten, Meinungen und
echo Schreibweisen. Jedes mal wenn du jemanden anschreibst, 
echo variiert die Laune und damit die Antworten des Profiles, 
echo was die Schwierigkeit nur noch steigert. 
echo.
echo Damit der Simulator realistischer wirkt, wird ein
echo Username und Passwort angefordert fuer dein eigenes 
echo Profil. Druecke 'ENTER' um zur Login-Seite zu gelangen. 
timeout 3 /NOBREAK >nul
pause >Nul
:loginpanel
set notracing=no
set try=3
:falstry
set dontmad=no
set password=RESET
set nickname=RESET
set register=RESET
set solution=Failure:%random%
set gesamtreputation=RESET
cls
echo.
echo *************** MyRobot %version% ***************
echo.
echo Willkommen bei Social Robot!
echo.
if not exist "Users\default.bat" echo ERROR 014: Standardprofil nicht vorhanden!&timeout /nobreak 8 >nul&goto attention
echo Gib hier deinen Usernamen ein. (3 Versuche)
echo Hast du kein Profil gib 'default' ein. 
echo.
set /p nickname=USERNAME: [- 
if /i "%nickname%"=="RESET" echo ERROR 016: Nickname eingeben!&timeout 5 >Nul&goto falstry
set register=Nein
if /i "%nickname%"=="default" echo Du hast kein Profil? Moechtest du eines?&set /p register=JA/NEIN --- 
if /i "%register%"=="Ja" set nickname=%username%&goto register
if /i "%nickname%"=="default" set nickname=%username%&set notracing=yes&goto useunsaved  
if not exist "Users\%nickname%.bat" echo ERROR 017: User existiert nicht!&timeout 10 >Nul&goto falstry
if not exist "Users\%nickname%_GesRep.bat" echo ERROR 065: GesRep nicht gefunden&timeout 10 >nul&goto falstry
if exist "Users\%nickname%.bat" call "Users\%nickname%.bat"
if exist "Users\%nickname%_GesRep.bat" call "Users\%nickname%_GesRep.bat"
set /p password=PASSWORT: [- 
echo.
if /i "%password%"=="%solution%" echo MELDUNG: Login-Authentifizierung erfolgreich!&timeout 5 >nul&goto useunsaved
echo ERROR 015: Fehlerhaftes Passwort.&set /a try=%try%-1
if /i %try% GTR 0 echo Noch %try% Versuche!&timeout 10 >nul
if /i %try% LSS 0 echo MELDUNG: Keine Versuche mehr uebrig. &timeout 5 >nul&exit
goto falstry


:useunsaved
if /i "%notracing%"=="yes" goto overgesamtpruef1234
if exist "Users\%nickname%_GesRep.bat" call "Users\%nickname%_GesRep.bat"
if not exist "Users\%nickname%_GesRep.bat" echo ERROR 085: Ges-Rep Datei existiert nicht.&timeout 10 >nul&goto attention
if /i "%gesamtreputation%"=="RESET" echo ERROR 066: Gesamt-REP fehlerhaft bestimmt.&timeout 10 >nul&goto attention
:overgesamtpruef1234
set black=nein
set password=RESET
set register=RESET
set solution=Failure:%random%
cls
echo.
echo *************** MyRobot %version% ***************
echo.
set gesrepanzeigeloginpanel=
if /i "%notracing%"=="no" if %gesamtreputation% LSS 0 echo ERROR 080: GesRep-Score unter 0.&timeout 6 /NOBREAK >NUL&goto start
if /i "%notracing%"=="no" set gesrepanzeigeloginpanel=Gesamt-Rep.: %gesamtreputation%/ 100 
echo Du bist eingeloggt. %gesrepanzeigeloginpanel%
if /i "%notracing%"=="no" echo Du hast bereits %gesamtaktivchat%x gechattet.
echo.
echo * Chatten (1) * Einstellungen (2) * Log Out (0) *
set mainmenu=CLEAR
set /p mainmenu=--- 
if /i "%mainmenu:~0,1%"=="1" goto mainchatten
if /i "%mainmenu%"=="chat" goto mainchatten
if /i "%mainmenu%"=="chatten" goto mainchatten
if /i "%mainmenu:~0,1%"=="2" goto mainsettings
if /i "%mainmenu%"=="settings" goto mainsettings
if /i "%mainmenu%"=="einstellungen" goto mainsettings
if /i "%mainmenu:~0,1%"=="0" goto loginpanel
if /i "%mainmenu%"=="beenden" goto loginpanel
if /i "%mainmenu%"=="exit" goto loginpanel
if /i "%mainmenu%"=="logout" goto loginpanel
if /i "%mainmenu%"=="log out" goto loginpanel
if /i "%mainmenu%"=="ausloggen" goto loginpanel
echo ERROR 002: Fehlerhafte Eingabe!&timeout 5 >nul&goto useunsaved

:mainsettings
cls 
echo.
echo *************** MyRobot - Settings ***************
echo.
echo * Design (1) * Profile (2) * Daten (3) * Zurueck (0) *
set submenu2=CLEAR
set /p submenu2=--- 
if /i "%submenu2%"=="daten" goto sub2data
if /i "%submenu2:~0,1%"=="3" goto sub2data
if /i "%submenu2%"=="datenschutz" goto sub2data
if /i "%submenu2%"=="verlauf" goto sub2data
if /i "%submenu2%"=="chat" goto sub2data
if /i "%submenu2:~0,1%"=="1" goto sub2design
if /i "%submenu2%"=="design" goto sub2design
if /i "%submenu2%"=="color" goto sub2design
if /i "%submenu2%"=="profile" goto sub2profile
if /i "%submenu2:~0,1%"=="2" goto sub2profile
if /i "%submenu2%"=="profil" goto sub2profile
if /i "%submenu2%"=="charakter" goto sub2profile
if /i "%submenu2:~0,1%"=="0" goto useunsaved
if /i "%submenu2%"=="beenden" goto useunsaved
if /i "%submenu2%"=="exit" goto useunsaved
if /i "%submenu2%"=="zurueck" goto useunsaved
echo ERROR 003: Fehlerhafte Eingabe!&timeout 5 >nul&goto mainsettings

:sub2data
cls
echo.
echo *************** MyRobot - Daten ***************
echo.
REM Gesamtreputation für einen Account auf 0 zurücksetzen. --> NUR mit Passwort! Aber auch einfach moeglich anzuschauen
echo * (1) Gesamtreputation * (2) Chatverlaeufe * (0) Exit *
set sub2dataoption=RESET
set /p sub2dataoption=--- 
if /i "%sub2dataoption%"=="RESET" echo ERROR 048: Option waehlen!&timeout 6 /NOBREAK >Nul&goto sub2data
if /i "%sub2dataoption%"=="Gesamtrep" goto sub2gesamtrep
if /i "%sub2dataoption%"=="Gesamtreputation" goto sub2gesamtrep
if /i "%sub2dataoption%"=="Reputation" goto sub2gesamtrep
if /i "%sub2dataoption:~0,1%"=="1" goto sub2gesamtrep
if /i "%sub2dataoption%"=="Chat" goto sub2chatverlaeufe
if /i "%sub2dataoption:~0,1%"=="2" goto sub2chatverlaeufe
if /i "%sub2dataoption%"=="Chatverlauf" goto sub2chatverlaeufe
if /i "%sub2dataoption%"=="Chatverlaeufe" goto sub2chatverlaeufe
if /i "%sub2dataoption%"=="Exit" goto mainsettings
if /i "%sub2dataoption:~0,1%"=="0" goto mainsettings
echo ERROR 049: Option existiert nicht.&timeout 6 /NOBREAK >NUL&goto sub2data

:sub2gesamtrep
set sub2dataoption=RESET
cls
echo.
echo *************** MyRobot - Gesamtreputation ***************
echo.
cd Users
dir /B /o:n | findstr /I /M GesRep
cd ..
echo.
echo Welche GesRep willst du sehen/loeschen? (*_GesRep.bat)
set gesrepselect=RESET
set /p gesrepselect=--- 
if /i "%gesrepselect%"=="RESET" echo ERROR 069: Option waehlen.&timeout 6 /NOBREAK >nul&goto sub2gesamtrep
if not exist "Users\%gesrepselect%_GesRep.bat" echo ERROR 070: Account existiert nicht.&timeout 6 /NOBREAK >nul&goto sub2gesamtrep
if exist "Users\%gesrepselect%_GesRep.bat" call "Users\%gesrepselect%_GesRep.bat"
set cachegesamtrep=%gesamtreputation%
set cacheanzahlchat=%gesamtaktivchat%
set gesamtreputation=RESET
set gesamtaktivchat=RESET
cls
echo.
echo *************** MyRobot - Gesamtreputation ***************
echo.
echo Account-Gesamtrep.: %cachegesamtrep% von 100
echo Vorhandene Chateintraege: %cacheanzahlchat%
echo.
echo * (1) Reset * (0) Exit *
set sub2gesamtrepoption=1597538426
set /p sub2gesamtrepoption=--- 
if /i "%sub2gesamtrepoption%"=="1597538426" echo ERROR 068: Option waehlen.&timeout 6 /NOBREAK >Nul&goto sub2gesamtrep
if /i "%sub2gesamtrepoption:~0,1%"=="1" goto sub2gesrepreset
if /i "%sub2gesamtrepoption%"=="reset" goto sub2gesrepreset
if /i "%sub2gesamtrepoption%"=="loeschen" goto sub2gesrepreset
if /i "%sub2gesamtrepoption%"=="zuruecksetzen" goto sub2gesrepreset
if /i "%sub2gesamtrepoption%"=="Exit" goto sub2data
if /i "%sub2gesamtrepoption:~0,1%"=="0" goto sub2data
echo ERROR 067: Option existiert nicht.&timeout 6 /NOBREAK >NUL&goto sub2gesamtrep

:sub2gesrepreset
cls
echo.
echo *************** MyRobot - Gesamtreputation ***************
echo.
echo Account-Gesamtrep.: %cachegesamtrep% von 100
echo User hat bereits %cacheanzahlchat%x gechattet.
echo.
echo Willst du die GesRep-Datei wirklich resetten?
set resetgesrep=Nein
set /p resetgesrep=--- 
if /i "%resetgesrep%"=="Nein" echo MELDUNG: GesRep nicht zurueckgesetzt.&timeout 6 >Nul&goto sub2gesamtrep
if /i "%resetgesrep%"=="ja" echo Gesamt-Reputation wird auf Standardwert (100) resettet.&timeout 3 /NOBREAK >nul&goto resetgesrepaction
echo ERROR 071: Option existiert nicht. [JA/NEIN]&timeout 6 /NOBREAK >NUL&goto sub2gesrepreset
:resetgesrepaction
echo.
if not exist "Users\%gesrepselect%_GesRep.bat" echo ERROR 072: GesRep-Datei existiert nicht mehr.&timeout 6 /NOBREAK >nul&goto sub2gesamtrep
if exist "Users\%gesrepselect%_GesRep.bat" del "Users\%gesrepselect%_GesRep.bat"
if exist "Users\%gesrepselect%_GesRep.bat" echo ERROR 073: GesRep-Datei konnte nicht geloescht werden.&timeout 6 /NOBREAK >nul&goto sub2gesamtrep
if not exist "Users\%gesrepselect%_GesRep.bat" echo set gesamtreputation=100>> "Users\%gesrepselect%_GesRep.bat"&echo set gesamtaktivchat=0 >> "Users\%gesrepselect%_GesRep.bat"
if not exist "Users\%gesrepselect%_GesRep.bat" echo ERROR 083: GesRep-Datei konnte nicht erstellt werden.&timeout 6 /NOBREAK >nul&goto sub2gesamtrep
if exist "Users\%gesrepselect%_GesRep.bat" echo MELDUNG: Gesamt-Reputation erfolgreich zurueckgesetzt.&timeout 6 /NOBREAK >Nul&goto sub2data


:sub2chatverlaeufe
set sub2dataoption=RESET
cls
echo.
echo *************** MyRobot - Chatverlauf ***************
echo.
echo * (1) Ansehen * (2) Loeschen * (0) Exit *
set sub2chatverlaufoption=RESET
set /p sub2chatverlaufoption=--- 
if /i "%sub2chatverlaufoption%"=="RESET" echo ERROR 051: Option waehlen.&timeout 6 /NOBREAK >Nul&goto sub2chatverlaeufe
if /i "%sub2chatverlaufoption%"=="loeschen" goto sub2chatloeschen
if /i "%sub2chatverlaufoption%"=="delete" goto sub2chatloeschen
if /i "%sub2chatverlaufoption:~0,1%"=="2" goto sub2chatloeschen
if /i "%sub2chatverlaufoption:~0,1%"=="1" goto sub2chatsehen
if /i "%sub2chatverlaufoption%"=="view" goto sub2chatsehen
if /i "%sub2chatverlaufoption%"=="sehen" goto sub2chatsehen
if /i "%sub2chatverlaufoption%"=="ansehen" goto sub2chatsehen
if /i "%sub2chatverlaufoption%"=="Exit" goto sub2data
if /i "%sub2chatverlaufoption:~0,1%"=="0" goto sub2data
echo ERROR 050: Option existiert nicht.&timeout 6 /NOBREAK >NUL&goto sub2chatverlaeufe

:sub2chatloeschen
set sub2chatverlaufoption=RESET
set delchat=RESET
cls 
echo.
echo *************** MyRobot - Delete Chat ***************
echo.
echo Gefundene Chats: 
cd chats
dir /B /ON
cd ..
echo.
echo Welchen willst du loeschen? [Dateiname ohne .bat] [0/Exit]
echo Alle Chats loeschen: [Alle]
set /p delchat=--- 
if /i "%delchat%"=="exit" goto sub2chatverlaeufe
if /i "%delchat%"=="0" goto sub2chatverlaeufe
if /i "%delchat%"=="RESET" echo ERROR 057: Chat-ID eingeben!&timeout 10 >Nul&goto sub2chatloeschen
if not exist "Chats\%delchat%.bat" echo ERROR 052: Chat existiert nicht!&timeout 10 >nul&goto sub2chatloeschen
echo.
:delchatpasswordeingabe
echo Master-Passwort eingeben: 
set /p delchatpassw=--- 
if exist "Users\Kevin.bat" call "Users\Kevin.bat"
if "%delchatpassw%"=="%solution%" echo MELDUNG: Master-Passwort korrekt.&timeout 6 >Nul&goto allowchatdelete
echo ERROR 056: Account nicht gefunden oder falsches Passwort.&timeout 10 >Nul&goto sub2chatloeschen
:allowchatdelete
set solution=RESET
if /i "%delchat%"=="alle" goto deleteallchats
if /i "%delchat%"=="[alle]" goto deleteallchats
if not exist "Chats\%delchat%.bat" echo ERROR 054: Chat exisitert nicht mehr!&timeout 10 >nul&goto sub2chatloeschen
if exist "Chats\%delchat%.bat" del /F "Chats\%delchat%.bat"
if not exist "Chats\%delchat%.bat" echo MELDUNG: Chat wurde erfolgreich geloescht!&timeout 10 >nul&goto sub2chatloeschen
if exist "Chats\%delchat%.bat" echo ERROR 053: Chat konnte nicht geloescht werden!&timeout 10 >Nul&goto sub2chatloeschen
echo ERROR 055: Unbekannter Fehler!&timeout 10 /NOBREAK >Nul&goto useunsaved

:deleteallchats
del "Chats\*.bat" || echo ERROR 084: Es konnten nicht alle Chats geloescht werden.&timeout 10 >Nul&goto sub2chatloeschen
echo MELDUNG: Alle Chats sollten geloescht sein.&timeout 10 >Nul
goto sub2chatloeschen


:sub2chatsehen
set sub2chatverlaufoption=RESET
set showchat=RESET
cls
echo.
echo *************** MyRobot - Chat Ansehen ***************
echo.
echo Gefundene Chats: 
cd chats
dir /B /ON
cd ..
echo.
echo Welchen willst du sehen? [Dateiname ohne .bat] [Exit/0]
set /p showchat=--- 
if /i "%showchat%"=="exit" goto sub2chatverlaeufe
if /i "%showchat%"=="0" goto sub2chatverlaeufe
if /i "%showchat%"=="RESET" echo ERROR 059: Chat-ID eingeben!&timeout 10 >Nul&goto sub2chatsehen
if not exist "Chats\%showchat%.bat" echo ERROR 058: Chat existiert nicht!&timeout 10 >nul&goto sub2chatsehen
echo.
if exist "Chats\%showchat%.bat" call "Chats\%showchat%.bat"
pause >nul
goto sub2chatsehen
echo ERROR 060: Unbekannter Fehler!&timeout 10 /NOBREAK >Nul&goto useunsaved

:sub2design
cls
echo.
echo *************** MyRobot - CreateDesign ***************
echo.
echo - Farbentabelle: 
echo 0 = Schwarz	8 = Dunkelgrau
echo 1 = Dunkelblau	9 = Blau
echo 2 = Dunkelgruen	A = Gruen
echo 3 = Blaugruen	B = Cyan
echo 4 = Dunkelrot	C = Rot
echo 5 = Lila	D = Magenta
echo 6 = Ocker	E = Gelb
echo 7 = Hellgrau	F = Weiss
echo.
echo Gib 2 Ziffern bzw. Buchstaben ein. ('Exit' fuer Zurueck)
echo Die 1. definiert den Hintergrund und die 2. die Schrift.
set neuesdesignstandard=CLEAR
set /p neuesdesignstandard=--- 
if /i "%neuesdesignstandard%"=="CLEAR" echo ERROR 013: Falscher Farbencode!
if /i "%neuesdesignstandard%"=="exit" goto mainsettings
color %neuesdesignstandard:~0,2%
echo.
echo So sieht Ihr neues Design aus. 
echo Moechten Sie es speichern?
set neuesdesignstandardsave=nein
set /p neuesdesignstandardsave=--- 
if /i "%neuesdesignstandardsave%"=="ja" if exist MyRobot_Color.bat del MyRobot_Color.bat&echo color %neuesdesignstandard%>> MyRobot_Color.bat&echo MELDUNG: Design gespeichert und aktiv.&timeout 10 >nul&goto mainsettings
if /i "%neuesdesignstandardsave%"=="nein" echo MELDUNG: Design verworfen. Design fuer diese Sitzung aktiv.&timeout 10 >nul&goto mainsettings
echo ERROR 005: Fehlerhafte Eingabe. [%design:~0,2%]&timeout 5 >nul&goto sub2design

:sub2profile
cls 
echo.
echo *************** MyRobot - User ***************
echo.
echo Gefundene User: 
cd users
dir /B /o:n | findstr /I /V _
cd ..
echo.
echo * Registrieren (1) * Entfernen (2) * Zurueck (0) *
set /p useroption=--- 
if /i "%useroption:~0,1%"=="1" goto register
if /i "%useroption%"=="registrieren" goto register
if /i "%useroption%"=="register" goto register
if /i "%useroption:~0,1%"=="2" goto loeschen
if /i "%useroption%"=="entfernen" goto loeschen
if /i "%useroption%"=="loeschen" goto loeschen
if /i "%useroption:~0,1%"=="0" goto mainsettings
if /i "%useroption%"=="beenden" goto mainsettings
if /i "%useroption%"=="exit" goto mainsettings
if /i "%useroption%"=="zurueck" goto mainsettings
echo ERROR 018: Fehlerhafte Eingabe!&timeout 5 >Nul&goto sub2profile
:register
set dontmad=yes
set createuser=RESET
set createpassw=RESET
REM Passw. und PasswConfirm bewusst unterschiedlich vordeklariert. 
set createpasswconfirm=CLEAR
cls 
echo.
echo *************** MyRobot - Register User ***************
echo.
echo Gib deine Daten an: [Gross-/Kleinschreibung beachten]
set /p createuser=USERNAME: [- 
if /i "%createuser%"=="RESET" echo ERROR 024: Username eingeben.&timeout 10 >Nul&goto register
if /i "%createuser%"=="MyRobot" echo ERROR 046: Der Name 'MyRobot' ist gesperrt.&timeout 10 >Nul&goto register
if /i "%createuser%"=="default" echo ERROR 047: Der Name 'Default' ist gesperrt.&timeout 10 >Nul&goto register
if exist "Users\%createuser%.bat" echo ERROR 025: Username existiert bereits.&timeout 10 >nul&goto register
set black=%createuser%
if exist "Blacklist.bat" call "Blacklist.bat"
if not exist "Blacklist.bat" echo ERROR 026: Blacklist nicht vorhanden.&timeout 10 >nul&goto register
if /i "%black%"=="ja" echo ERROR 027: Schimpfwort geblockt.&timeout 10 >Nul&goto register
set dontmad=no
set passwordconfirmed=no
set /p createpassw=PASSWORD: [- 
if /i "%createpassw%"=="RESET" echo ERROR 037: Passwort eingeben.&timeout 10 >Nul&goto register
if /i "%createpassw%"=="%createuser%" echo ERROR 031: Passwort darf nicht gleich Username sein.&timeout 10 >Nul&goto register
if /i "%createpassw:~0,4%"=="0000" echo ERROR 032: Passwort darf nicht zu viele '0' enthalten.&timeout 10 >Nul&goto register
if /i "%createpassw:~0,2%"=="%createpassw:~2,2%" echo ERROR 033: Verwenden Sie ein schwereres Passwort.&timeout 10 >Nul&goto register
set /p createpasswconfirm=CONFIRM PASSWORD: [- 
if /i "%createpasswconfirm%"=="CLEAR" echo ERROR 038: Passwort nicht erneut eingegeben.&timeout 10 >Nul&goto register
if /i "%createpassw%"=="%createpasswconfirm%" set passwordconfirmed=yes
if /i "%passwordconfirmed%"=="no" echo ERROR 028: Passwort stimmt nicht ueberein.&timeout 10 >Nul&goto register
if exist "Users\%createuser%_GesRep.bat" echo ERROR 061: GesRep-Datei existiert bereits.&timeout 10 >Nul&goto register
echo set nickname=%createuser%>> "Users\%createuser%.bat"
echo set solution=%createpassw%>> "Users\%createuser%.bat"
echo set gesamtreputation=100>> "Users\%createuser%_GesRep.bat"
echo set gesamtaktivchat=0 >> "Users\%createuser%_GesRep.bat"
REM Hier wird die Start-Gesamt-Reputation beim Erstellen eines Profiles bestimmt. 
if not exist "Users\%createuser%_GesRep.bat" echo ERROR 062: GesRep wurde nicht erstellt.&timeout 10 >nul&goto register
if not exist "Users\%createuser%.bat" echo ERROR 029: Profil wurde nicht erstellt.&timeout 10 >nul&goto register
if exist "Users\%createuser%.bat" if exist "Users\%createuser%_GesRep.bat" echo MELDUNG: Benutzer und GesRep-Datei erfolgreich registriert.&if exist "Users\%createuser%.bat" call "Users\%createuser%.bat"&if exist "Users\%createuser%_GesRep.bat" call "Users\%createuser%_GesRep.bat"&timeout 10 >Nul&goto useunsaved
echo ERROR 030: Unbekannter Fehler!&timeout 10 /NOBREAK >Nul&goto useunsaved

:loeschen
set deluser=RESET
set solution=RESET
cls 
echo.
echo *************** MyRobot - Delete User ***************
echo.
echo Gefundene User: 
cd users
dir /B /o:n | findstr /I /V _
cd ..
echo.
echo Welcher User soll geloescht werden? (Nickname ohne '.bat')
set /p deluser=--- 
if /i "%deluser%"=="Kevin" echo ERROR 036: 'Kevin' ist das Master-Profil.&timeout 10 >nul&goto sub2profile
if /i "%deluser%"=="Default" echo ERROR 023: Standard-Profil 'Default.bat' ist eine Systemdatei.&timeout 10 >nul&goto sub2profile
if /i "%deluser%"=="RESET" echo ERROR 019: Username eingeben!&timeout 10 >Nul&goto loeschen
if not exist "Users\%deluser%.bat" echo ERROR 020: Username existiert nicht!&timeout 10 >nul&goto loeschen
echo.
echo Master-Passwort oder Account-Passwort eingeben: 
set /p delpasswort=--- 
if not exist "Users\%deluser%_GesRep.bat" echo ERROR 064: GesRep-Datei existiert nicht.&timeout 10 >nul&goto loeschen
if exist "Users\%deluser%.bat" call "Users\%deluser%.bat"&if "%delpasswort%"=="%solution%" echo MELDUNG: Account-Passwort korrekt.&timeout 6 >Nul&goto allowdelete
if exist "Users\%deluser%.bat" if %delpasswort% NEQ %solution% echo ERROR 035: Falsches Passwort.&timeout 10 >nul&goto loeschen
if not exist "Users\%deluser%.bat" echo ERROR 074: Account existiert nicht.&timeout 4 /NOBREAK >nul&goto loeschen
if exist "Users\Kevin.bat" call "Users\Kevin.bat"&if "%delpasswort%"=="%solution%" echo MELDUNG: Master-Passwort korrekt.&timeout 6 >Nul&goto allowdelete
echo ERROR 075: Unbekannter Fehler.&timeout 10 >Nul&goto loeschen
:allowdelete
set solution=RESET
if not exist "Users\%deluser%_GesRep.bat" echo ERROR 063: GesRep existiert nicht mehr.&timeout 10 >nul&goto loeschen
if not exist "Users\%deluser%.bat" echo ERROR 034: Account exisitert nicht mehr!&timeout 10 >nul&goto loeschen
if exist "Users\%deluser%.bat" del /F "Users\%deluser%.bat"
if not exist "Users\%deluser%.bat" echo MELDUNG: Account wurde erfolgreich geloescht!&timeout 10 >nul&goto useunsaved
if exist "Users\%deluser%.bat" echo ERROR 021: Benutzer konnte nicht geloescht werden!&timeout 10 >Nul&goto sub2profile
echo ERROR 022: Unbekannter Fehler!&timeout 10 /NOBREAK >Nul&goto useunsaved

:mainchatten
set load=failure
set loadprofile=RESE
cls
echo.
echo *************** MyRobot - Chatten ***************
echo.
echo Gefundene Charaktere: 
cd profiles
dir /B /ON
cd ..
echo.
echo Mit wem moechtest du chatten? (Charakter ohne .bat eingeben)
set /p loadprofile=--- 
if /i "%loadprofile%"=="RESET" echo ERROR 043: Profil angeben!&timeout 7 >nul&goto mainchatten
if exist "Profiles\%loadprofile%.bat" call "Profiles\%loadprofile%.bat"
if not exist "Profiles\%loadprofile%.bat" echo ERROR 044: Profil existiert nicht.
if /i "%load%"=="failure" echo ERROR 007: Profil nicht vollstaendig geladen. &timeout /NOBREAK 7 >Nul&goto useunsaved
if /i "%load%"=="successful" echo MELDUNG: Profil erfolgreich aktiviert. &timeout /NOBREAK 2 >nul

:levelsetting
cls
echo.
echo *************** MyRobot - Level ***************
echo.
echo Schwierigkeit einstellen [NORMAL=STANDARD]
echo ASSI (0) * LEICHT (1) * NORMAL (2) * SCHWER (3) * BRUTAL (4) *
set schwierigkeit=NORMAL
set /p schwierigkeit=--- 
if /i "%schwierigkeit%"=="0" set schwierigkeit=ASSI&&goto leveleingestellt
if /i "%schwierigkeit%"=="assi" set schwierigkeit=ASSI&&goto leveleingestellt
if /i "%schwierigkeit%"=="1" set schwierigkeit=LEICHT&&goto leveleingestellt
if /i "%schwierigkeit%"=="leicht" set schwierigkeit=LEICHT&&goto leveleingestellt
if /i "%schwierigkeit%"=="2" set schwierigkeit=NORMAL&&goto leveleingestellt
if /i "%schwierigkeit%"=="normal" set schwierigkeit=NORMAL&&goto leveleingestellt
if /i "%schwierigkeit%"=="3" set schwierigkeit=SCHWER&&goto leveleingestellt
if /i "%schwierigkeit%"=="schwer" set schwierigkeit=SCHWER&&goto leveleingestellt
if /i "%schwierigkeit%"=="4" set schwierigkeit=BRUTAL&&goto leveleingestellt
if /i "%schwierigkeit%"=="brutal" set schwierigkeit=BRUTAL&&goto leveleingestellt
echo ERROR 045: Schwierigkeitsstufe existiert nicht..&timeout 5 /NOBREAK >nul&goto levelsetting

:leveleingestellt
REM Hier Start des Chats
REM Algorithmen in eigene Algo.bat datei. bei jedem chat neu. Hier werden zufallszahlen/variablen abgespeichert nach der definition. 
call echo !random! >nul
REM set /a laune=11*!random!/32767+1
REM Hier neue Laune Zufallslaune für Gesamtrep Miteinbeziehung
set /a laune=100*!random!/32767+1
if exist Algorithmen.bat call Algorithmen.bat
REM NowReputation wird in den Algorithmen bestimmt. Da Launen die StartNOWReputation beieinflusst. 
if not exist Algorithmen.bat echo ERROR 008: Algorithmen nicht vorhanden!&echo MyRobot neu installieren!&timeout 10 >nul&goto useunsaved
if exist Profiles\%loadprofile%.bat call Profiles\%loadprofile%.bat
if not exist Profiles\%loadprofile%.bat echo ERROR 039: Profildaten nicht vorhanden!&echo MyRobot neu installieren!&timeout 10 >nul&goto useunsaved
REM Starte Chat
if not exist "Online\%loadprofile%.htm" goto notonline
cls
echo.
echo *************** Charakter - %loadprofile% ***************
echo.
echo %loadprofile% hat ein Online Profil!
echo Moechtest du die Chronik sehen?
set chronikview=nein
set /p chronikview=--- 
if /i "%chronikview%"=="ja" start chrome.exe "Online\%loadprofile%.htm"
:notonline
if /i "%nowreputationstart%"=="RESET" call Algorithmen.bat || cls&echo.&echo ERROR 086: Algo-Datei nicht aufgerufen und &echo fehlerhafte Variablenbestimmung.&echo %cd%&timeout 10 >Nul&goto attention
set dontmad=no
cls
echo.
echo *************** Charakter - %loadprofile% ***************
echo.
echo Schreibe %loadprofile% jetzt an! Wie auf Facebook!
echo.
set frage1=1597532648
set /p frage1=%nickname%: 
set black=%frage1%
if exist Blacklist.bat call Blacklist.bat
if not exist Blacklist.bat echo ERROR 009: Blacklist nicht vorhanden!&timeout 5 >nul
if /i "%black%"=="ja" goto exitchat
set black=nein&set blackword=RESET
set wgfirstask=no
call echo !random! >nul&set /a wgfirstaskrep=3*!random!/32767-1
echo "%frage1%"|findstr /i "wie">nul && echo "%frage1%"|findstr /i "geh">nul && set /a nowreputation=%nowreputation%+%wgfirstaskrep% && set wgfirstask=yes
echo "%frage1%"|findstr /i "wg">nul && set /a nowreputation=%nowreputation%+%wgfirstaskrep% && set wgfirstask=yes
REM HIER EVTL FINDSTR /i ZUSATZANTWORTEN GEBEN. MIT LAUNESMILEY von laune und NowReputation dazu- und abziehen/rechnen. 
REM Darauf achten dass auch Wütend noch über 20 kommen KANN. (schleimen(negativ), sehr nett(positiv)) 
set controlsame=%frage1%
set frage1=RESET
timeout 2 /nobreak >nul&echo %loadprofile%: %begr%
if /i "%wgfirstask%"=="yes" goto wgfirstask
set frage2=1597532648
set /p frage2=%nickname%: 
set black=%frage2%
if exist Blacklist.bat call Blacklist.bat
if not exist Blacklist.bat echo ERROR 010: Blacklist nicht vorhanden!&timeout 5 >nul
if /i "%black%"=="ja" goto exitchat
set black=nein&set blackword=RESET
if /i "%controlsame%"=="%frage2%" echo %loadprofile%: Schreib doch mal was Anderes..&&echo.&&echo ############### %loadprofile% ist offline ###############&&set nowreputation=0&&pause >nul&&goto exitchat
set controlsame=%frage2%
set frage2=RESET
:wgfirstask
timeout 3 /nobreak >nul&echo %loadprofile%: %launeantwort%
set frage3=1597532648
set /p frage3=%nickname%: 
set black=%frage3%
if exist Blacklist.bat call Blacklist.bat
if not exist Blacklist.bat echo ERROR 011: Blacklist nicht vorhanden!&timeout 5 >nul
if /i "%black%"=="ja" goto exitchat
set black=nein&set blackword=RESET
if /i "%controlsame%"=="%frage3%" echo %loadprofile%: Hast du auch mehr in deinem Wortschatz?&&echo.&&echo ############### %loadprofile% ist offline ###############&&set nowreputation=0&&pause >nul&&goto exitchat
set controlsame=%frage3%
REM Wenn wmg nicht gefragt soll er fragen. also andere antwort. 
set wmfirstask=no
call echo !random! >nul&set /a wmfirstaskrep=3*!random!/32767-1
echo "%frage3%"|findstr /i "was">nul && echo "%frage3%"|findstr /i "tus">nul && set /a nowreputation=%nowreputation%+%wmfirstaskrep% && set wmfirstask=yes
echo "%frage3%"|findstr /i "was">nul && echo "%frage3%"|findstr /i "mach">nul && set /a nowreputation=%nowreputation%+%wmfirstaskrep% && set wmfirstask=yes
echo "%frage3%"|findstr /i "wm">nul && set /a nowreputation=%nowreputation%+%wmfirstaskrep% && set wmfirstask=yes
set frage3=RESET
set wmgaskanswer=RESET
if /i "%wmfirstask%"=="no" timeout 3 /NOBREAK >Nul&echo %loadprofile%: %wmgask%
if /i "%wmfirstask%"=="no" set /p wmgaskanswer=%nickname%: 
if /i "%wmfirstask%"=="no" echo "%wmgaskanswer%"|findstr /i "du">nul && set /a nowreputation=%nowreputation%+%wmfirstaskrep%+2 && timeout 2 /NOBREAK >nul && echo %loadprofile%: %wmgaskanswerpc%&&goto musikask
if /i "%wmfirstask%"=="no" set /a nowreputation=%nowreputation%-3&goto musikask
timeout 2 /nobreak >nul&echo %loadprofile%: %wmg%
set frage4=1597532648
set /p frage4=%nickname%: 
set black=%frage4%
if exist Blacklist.bat call Blacklist.bat
if not exist Blacklist.bat echo ERROR 012: Blacklist nicht vorhanden!&timeout 5 >nul
if /i "%black%"=="ja" goto exitchat
set black=nein&set blackword=RESET
if /i "%controlsame%"=="%frage4%" echo %loadprofile%: Schreib nicht immer das Selbe.&&echo.&&echo ############### %loadprofile% ist offline ###############&&set nowreputation=0&&pause >nul&&goto exitchat
set controlsame=%frage4%
set frage4=RESET
timeout 1 /nobreak >nul
if /i %nowreputation% LEQ 20 echo.&echo ############### %loadprofile% ist offline ###############&pause >nul&goto exitchat 



REM Hier dann überprüfen ob NowReputation ist gleich und oder unter 20 wegen gestresst! Nicht mehr NUR durch die Launen entscheiden. 
:musikask
timeout 1 /NOBREAK >nul
echo %loadprofile%: %smalltalkstop%
REM Start der Kennenlernphase mit den Profildaten!

REM Kennenlernphase automatisch zufaellig durchmischen! Fuer unterschiedlichen Gesprächsverlauf
set frage5=RESET
set alreadydeclared=no
set /p frage5=%nickname%: 
set black=%frage5%
if exist Blacklist.bat call Blacklist.bat
if not exist Blacklist.bat echo ERROR 040: Blacklist nicht vorhanden!&timeout 5 >nul
if /i "%black%"=="ja" goto useunsaved
timeout 1 /nobreak >nul 
set musikka=nein&set musikalle=nein&set rock=nein&set house=nein&set metal=nein&set sad=nein&set fox=nein&set volksmusik=nein&set electro=nein&set dubstep=nein&set klassik=nein&set rocklike=no&set houselike=no&set metallike=no&set sadlike=no&set foxlike=no&set volksmusiklike=no&set electrolike=no&set dubsteplike=no&set klassiklike=no
if not exist "Profiles\%loadprofile%.bat" echo ERROR 042: Profil nicht gefunden. 
call "Profiles\%loadprofile%.bat"
echo "%frage5%"|findstr /i "rock">nul && set likemusik=yes && echo "%musik%"|findstr /i "rock">nul && set rocklike=yes
echo "%frage5%"|findstr /i "house">nul && set likemusik=yes && echo "%musik%"|findstr /i "house">nul && set houselike=yes
echo "%frage5%"|findstr /i "metal">nul && set likemusik=yes && echo "%musik%"|findstr /i "metal">nul && set metallike=yes
echo "%frage5%"|findstr /i "traurig">nul && set likemusik=yes && echo "%musik%"|findstr /i "traurig">nul && set sadlike=yes
echo "%frage5%"|findstr /i "fox">nul && set likemusik=yes && echo "%musik%"|findstr /i "fox">nul && set foxlike=yes
echo "%frage5%"|findstr /i "volksmusik">nul && set likemusik=yes && echo "%musik%"|findstr /i "volksmusik">nul && set volksmusiklike=yes
echo "%frage5%"|findstr /i "electr">nul && set likemusik=yes && echo "%musik%"|findstr /i "electr">nul && set electrolike=yes
echo "%frage5%"|findstr /i "dubstep">nul && set likemusik=yes && echo "%musik%"|findstr /i "dubstep">nul && set dubsteplike=yes
echo "%frage5%"|findstr /i "klassik">nul && set likemusik=yes && echo "%musik%"|findstr /i "klassik">nul && set klassiklike=yes
set musikalle=no&set musikka=no
echo "%frage5%"|findstr /i "alle">nul && set musikalle=yes
echo "%frage5%"|findstr /i "viel">nul && set musikalle=yes
echo "%frage5%"|findstr /i "RESET">nul && set musikka=yes
echo "%frage5%"|findstr /i "kp">nul && set musikka=yes
echo "%frage5%"|findstr /i "ka">nul && set musikka=yes
echo "%frage5%"|findstr /i "koa">nul && set musikka=yes
echo "%frage5%"|findstr /i "kein">nul && set musikka=yes
echo "%frage5%"|findstr /i "nix">nul && set musikka=yes
echo "%frage5%"|findstr /i "nicht">nul && set musikka=yes
if /i "%musikka%"=="yes" set /a nowreputation=%nowreputation%-7
if /i "%musikalle%"=="yes" set /a nowreputation=%nowreputation%-5
if /i "%rocklike%"=="yes" set /a nowreputation=%nowreputation%+5
if /i "%houselike%"=="yes" set /a nowreputation=%nowreputation%+5
if /i "%metallike%"=="yes" set /a nowreputation=%nowreputation%+5
if /i "%sadlike%"=="yes" set /a nowreputation=%nowreputation%+5
if /i "%foxlike%"=="yes" set /a nowreputation=%nowreputation%+5
if /i "%volksmusiklike%"=="yes" set /a nowreputation=%nowreputation%+5
if /i "%electrolike%"=="yes" set /a nowreputation=%nowreputation%+5
if /i "%dubsteplike%"=="yes" set /a nowreputation=%nowreputation%+5
if /i "%klassiklike%"=="yes" set /a nowreputation=%nowreputation%+5
if /i "%rocklike%"=="no" if /i "%houselike%"=="no" if /i "%metallike%"=="no" if /i "%sadlike%"=="no" if /i "%foxlike%"=="no" if /i "%volksmusiklike%"=="no" if /i "%electrolike%"=="no" if /i "%dubsteplike%"=="no" if /i "%klassiklike%"=="no" set /a nowreputation=%nowreputation%-10
if /i "%musikka%"=="yes" echo %loadprofile%: %musikkatext%&timeout 3 /NOBREAK >nul&goto musikask
if /i "%musikalle%"=="yes" echo %loadprofile%: %musikalletext%&timeout 3 /NOBREAK >nul&goto overmusikchat
if /i "%likemusik%"=="nein" echo %loadprofile%: %nomusiklike%&timeout 3 /NOBREAK >nul&goto overmusikchat

REM Um NowRep nicht neu zu bestimmen. 
set alreadydeclared=yes
if /i "%rocklike%"=="yes" set bothmusik=Rock Songs&if exist "Algorithmen.bat" call "Algorithmen.bat"
if /i "%rocklike%"=="yes" echo %loadprofile%: %musikbeide%&timeout 2 /NOBREAK >nul&echo %loadprofile%: %loadmusik%&if /i %laune% NEQ 6 start "C:\Program Files (x86)\Windows Media Player\wmplayer.exe" "Musik\Oomph - Bonobo.mp3"&timeout 5 >nul&goto overmusikchat
if /i "%rocklike%"=="yes" timeout 3 >nul&goto overmusikchat
if /i "%houselike%"=="yes" set bothmusik=House Lieder&if exist "Algorithmen.bat" call "Algorithmen.bat"
if /i "%houselike%"=="yes" echo %loadprofile%: %musikbeide%&timeout 2 /NOBREAK >nul&echo %loadprofile%: %loadmusik%&if /i %laune% NEQ 6 start "C:\Program Files (x86)\Windows Media Player\wmplayer.exe" "Musik\ItaloBrother - my life is a party.mp3"&timeout 5 >nul&goto overmusikchat
if /i "%houselike%"=="yes" timeout 3 >nul&goto overmusikchat
if /i "%metallike%"=="yes" set bothmusik=Metal Songs&if exist "Algorithmen.bat" call "Algorithmen.bat"
if /i "%metallike%"=="yes" echo %loadprofile%: %musikbeide%&timeout 2 /NOBREAK >nul&echo %loadprofile%: %loadmusik%&if /i %laune% NEQ 6 start "C:\Program Files (x86)\Windows Media Player\wmplayer.exe" "Musik\Celldweller - Own Little World.mp3"&timeout 5 >nul&goto overmusikchat
if /i "%metallike%"=="yes" timeout 3 >nul&goto overmusikchat
if /i "%sadlike%"=="yes" set bothmusik=Traurige Lieder&if exist "Algorithmen.bat" call "Algorithmen.bat"
if /i "%sadlike%"=="yes" echo %loadprofile%: %musikbeide%&timeout 2 /NOBREAK >nul&echo %loadprofile%: %loadmusik%&if /i %laune% NEQ 6 start "C:\Program Files (x86)\Windows Media Player\wmplayer.exe" "Musik\Celine Dion-My Heart Will Go On.mp3"&timeout 5 >nul&goto overmusikchat
if /i "%sadlike%"=="yes" timeout 3 >nul&goto overmusikchat
if /i "%foxlike%"=="yes" set bothmusik=Fox Musik&if exist "Algorithmen.bat" call "Algorithmen.bat"
if /i "%foxlike%"=="yes" echo %loadprofile%: %musikbeide%&timeout 2 /NOBREAK >nul&echo %loadprofile%: %loadmusik%&if /i %laune% NEQ 6 start "C:\Program Files (x86)\Windows Media Player\wmplayer.exe" "Musik\Guys n Dolls - I Got The Fire In Me.mp3"&timeout 5 >nul&goto overmusikchat
if /i "%foxlike%"=="yes" timeout 3 >nul&goto overmusikchat
if /i "%volksmusiklike%"=="yes" set bothmusik=Volksmusik Lieder&if exist "Algorithmen.bat" call "Algorithmen.bat"
if /i "%volksmusiklike%"=="yes" echo %loadprofile%: %musikbeide%&timeout 2 /NOBREAK >nul&echo %loadprofile%: %loadmusik%&if /i %laune% NEQ 6 start "C:\Program Files (x86)\Windows Media Player\wmplayer.exe" "Musik\Die Unterkaerntner - Rockn Roll und Volksmusik.mp3"&timeout 5 >nul&goto overmusikchat
if /i "%volksmusiklike%"=="yes" timeout 3 >nul&goto overmusikchat
if /i "%electrolike%"=="yes" set bothmusik=Electro Remix&if exist "Algorithmen.bat" call "Algorithmen.bat"
if /i "%electrolike%"=="yes" echo %loadprofile%: %musikbeide%&timeout 2 /NOBREAK >nul&echo %loadprofile%: %loadmusik%&if /i %laune% NEQ 6 start "C:\Program Files (x86)\Windows Media Player\wmplayer.exe" "Musik\Torstein Horgmo - 2013.mp3"&timeout 5 >nul&goto overmusikchat
if /i "%electrolike%"=="yes" timeout 3 >nul&goto overmusikchat
if /i "%dubsteplike%"=="yes" set bothmusik=Dubstep Remix&if exist "Algorithmen.bat" call "Algorithmen.bat"
if /i "%dubsteplike%"=="yes" echo %loadprofile%: %musikbeide%&timeout 2 /NOBREAK >nul&echo %loadprofile%: %loadmusik%&if /i %laune% NEQ 6 start "C:\Program Files (x86)\Windows Media Player\wmplayer.exe" "Musik\Tristam - I Remember.mp3"&timeout 5 >nul&goto overmusikchat
if /i "%dubsteplike%"=="yes" timeout 3 >nul&goto overmusikchat
if /i "%klassiklike%"=="yes" set bothmusik=Klassische Kompositionen&if exist "Algorithmen.bat" call "Algorithmen.bat"
if /i "%klassiklike%"=="yes" echo %loadprofile%: %musikbeide%&timeout 2 /NOBREAK >nul&echo %loadprofile%: %loadmusik%&if /i %laune% NEQ 6 start "C:\Program Files (x86)\Windows Media Player\wmplayer.exe" "Musik\Mozart - Sonate Nr 48.mp3"&timeout 5 >nul&goto overmusikchat
if /i "%klassiklike%"=="yes" goto overmusikchat
echo %loadprofile%: %nomusikbeide%&timeout 2 /NOBREAK >nul&goto overmusikchat
echo ERROR 041: IF uebersprungen. &timeout 5 >nul&goto exitchat

REM Findstr /i wenn erwartetes wie gehts usw hallo musik usw vorhanden ist dann normale antwort sonst kommt eine von 10 was meinst du usw? oder 
Rem dann noch nach weiteren möglichkeiten als findstr ketten fragen um mögliche antworten zu finden. 

REM Kommt die NowReputation über spezielle Meilensteine(man kann auch wieder nach
REM unten sinken, was die Änderungen rückgängig macht) die beispielsweise eine symphatischere Ausdrucksweise von MyRobot aktivieren oder Smileys 
REM häufiger machen usw. Maximalen Wert einrichten, dass man mit mehreren unsympathischen Nachrichten vom letzteren schneller gegen 0 sinkt gleich
REM auch wenn öfter hintereinander symphatisch + punkte höher ausfallen. Highscore am Ende vom Chat ausgeben lassen, mit MAX Reputation und eine
REM eigene Highscore Liste mit best and worst score. (0 ist Worst score, 100 best Score unter 0 geht er offline.) mit jeder laune eigene start reputaion 
rem (in einem rahmen von 70-80 zb wenn besser gelaunt)vorgeben. 100 sollte fast nicht möglich sein zu erreichen da man sehr symphatisch aber auch 
rem nicht schleimig schreiben soll. 
 
rem bei schimpfwörtern auch speichern und dann mit prozentquote wie oft der account schlecht mit schimpfwörtern gechattet
rem errechnen ob laune öfter gut oder schlecht bzw ob dieser überhaupt zurückschreibt. --> Für GesamtREPUTATION

:overmusikchat
REM HIER DEINE ANTWORT
pause >nul
:exitchat 
set vorzeichen=+
if /i "%notracing%"=="yes" goto showhighscore
set /a gesamtaktivchatneu=%gesamtaktivchat%+1
set nowrepaenderung=RESET
set /a nowrepaenderung=%nowreputation%/%gesamtaktivchatneu%
if %nowrepaenderung% LSS 0 echo ERROR 087: NowRep-Aenderung negativ.&echo Highscore wird generiert, aber nicht gespeichert. &timeout 6 /NOBREAK >NUL&goto declarehighscore
if %nowreputation% LEQ 0 set /a nowrepaenderung=%gesamtreputation%/2
if %nowreputation% LEQ 0 if %gesamtreputation% EQU 1 set /a nowrepaenderung=1
if %nowrepaenderung% EQU 0 set /a nowrepaenderung=%nowreputation%/(%gesamtaktivchat%*2/3)
if %nowrepaenderung% EQU 0 set /a nowrepaenderung=%nowreputation%/(%gesamtaktivchat%/3)
if %nowrepaenderung% EQU 0 set /a nowrepaenderung=%nowreputation%/(%gesamtaktivchat%/4)
if %nowrepaenderung% EQU 0 set /a nowrepaenderung=%nowreputation%/(%gesamtaktivchat%/6)
if %nowrepaenderung% EQU 0 set /a nowrepaenderung=%nowreputation%/(%gesamtaktivchat%/10)
if %nowreputation% LEQ 15 set /a gesamtreputationnew=%gesamtreputation%-%nowrepaenderung%&goto gesrepnewdeclared
if %nowreputation% LEQ 30 set /a gesamtreputationnew=%gesamtreputation%-(%nowrepaenderung%*2/3)&goto gesrepnewdeclared
if %nowreputation% LEQ 50 set /a gesamtreputationnew=%gesamtreputation%-(%nowrepaenderung%*1/3)&goto gesrepnewdeclared
if %nowreputation% LEQ 60 set /a gesamtreputationnew=%gesamtreputation%+(%nowrepaenderung%*1/3)&goto gesrepnewdeclared
if %nowreputation% LEQ 80 set /a gesamtreputationnew=%gesamtreputation%+(%nowrepaenderung%*2/3)&goto gesrepnewdeclared
if %nowreputation% GEQ 81 set /a gesamtreputationnew=%gesamtreputation%+%nowrepaenderung%&goto gesrepnewdeclared
:gesrepnewdeclared
if %gesamtreputationnew% GTR 100 set gesamtreputationnew=100
if %gesamtreputationnew% LSS 0 set gesamtreputationnew=0


if %gesamtreputationnew% LSS %gesamtreputation% set vorzeichen=-&set /a gesamtreputationdifferenz=%gesamtreputation%-%gesamtreputationnew%
if %gesamtreputation% LEQ %gesamtreputationnew% set /a gesamtreputationdifferenz=%gesamtreputationnew%-%gesamtreputation%
:showhighscore
if /i "%nowreputationstart%"=="RESET" echo ERROR 081: Start-NOW-Rep nicht deklariert.&echo - Mehrfacher Chatdurchlauf&echo.&echo Highscore wird mit vorhandenen Daten generiert.&timeout 2 /NOBREAK >NUL&timeout 5 >nul

if %nowreputation% GTR 100 set nowreputation=100
if %nowreputation% LSS 0 set nowreputation=0
:declarehighscore
cls
echo.
echo *************** MyRobot - HIGHSCORE ***************
echo.
if %gesamtaktivchat% GEQ 30 if %nowrepaenderung% LSS 1 echo MELDUNG: Du hast bereits oft gechattet.&echo Folgend wird es schwer die Gesamtreputation auszubessern, &echo da die Aenderungsrate gegen 0 geht. &echo.&echo Wir empfehlen das Resetten deines Accounts.&echo.&echo.
echo Dein USER: 				%nickname%
echo Chatpartner:				%loadprofile%
echo Laune: 					%launetext%
echo Start-Reputation:			%nowreputationstart%
echo.
echo End-Reputation:	 			%nowreputation%
REM Meistens 0?!
echo Schwierigkeit: 				%schwierigkeit%
if /i "%notracing%"=="yes" goto deletealgorithm
echo Gesamt-Reputation (%nickname%): 		%gesamtreputationnew%
if "%launetext%"=="Hassen" set gesamtreputationdifferenz=0
echo Aenderung zur alten Gesamt-REP: 	%vorzeichen% %gesamtreputationdifferenz%
if %nowrepaenderung% LSS 0 echo MELDUNG: Highscore wird nicht gespeichert.&timeout 5 /NOBREAK >NUL&goto savechatnowrep
set repeatsavehighscorechance=5
:repeatsavehighscore
if /i %repeatsavehighscorechance% LEQ 0 echo ERROR 078: Highscore konnte nicht gespeichert werden.&timeout /NOBREAK 6 >nul&goto savechatnowrep
if not exist "Users\%nickname%_GesRep.bat" echo ERROR 076: GesRep Datei nicht gefunden.&echo Neue GesRep.bat wird erstellt...&timeout 4 /NOBREAK >Nul&set repeatsavehighscorechance=%repeatsavehighscorechance%-1&goto repeatsavehighscore
if exist "Users\%nickname%_GesRep.bat" del "Users\%nickname%_GesRep.bat"
if exist "Users\%nickname%_GesRep.bat" echo ERROR 077: GesRep Datei konnte nicht geloescht werden.&echo Speicherablauf wird neugestartet...&timeout 4 /NOBREAK >nul&set repeatsavehighscorechance=%repeatsavehighscorechance%-1&goto repeatsavehighscore
if not exist "Users\%nickname%_GesRep.bat" echo set gesamtreputation=%gesamtreputationnew%>> "Users\%nickname%_GesRep.bat"&echo set gesamtaktivchat=%gesamtaktivchatneu% >> "Users\%nickname%_GesRep.bat"
if not exist "Users\%nickname%_GesRep.bat" echo ERROR 079: GesRep-Datei konnte nicht erstellt werden.&timeout 4 /NOBREAK >Nul&set repeatsavehighscorechance=%repeatsavehighscorechance%-1&goto repeatsavehighscore
:savechatnowrep
echo echo. >> "Chats\%savenr%-%nickname%_%loadprofile%.bat"
echo echo Laune: %launetext% /--/ Start-/Endreputation:  %nowreputationstart%/%nowreputation% >> "Chats\%savenr%-%nickname%_%loadprofile%.bat"
echo echo Diff. Gesamtrep.: %gesamtreputationdifferenz% >> "Chats\%savenr%-%nickname%_%loadprofile%.bat"
echo echo Ende des Chats am %date% um %time:~0,8% >> "Chats\%savenr%-%nickname%_%loadprofile%.bat"
:deletealgorithm
timeout 3 /NOBREAK >NUL
pause >nul
REM Algorithmen loeschen
if /i "%notracing%"=="no" set gesamtreputation=%gesamtreputationnew%
set gesamtreputationnew=RESET
set gesamtreputationdifferenz=RESET
set nowreputation=RESET
set nowreputationstart=RESET
set launetext=RESET
set laune=RESET
set chronikview=RESET
set black=RESET
set frage1=RESET&set frage2=RESET&set frage3=RESET&set frage4=RESET&set frage5=RESET
set loadprofile=RESET&set load=RESET
call echo !random! >nul
goto useunsaved