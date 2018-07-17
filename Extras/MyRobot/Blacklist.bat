if /i "%dontmad%"=="yes" goto sortout

REM Chatverläufe speichern -- Soll dann als Bat im MyRobot Programm aufrufbar sein. Und löschbar usw. 
if /i "%notracing%"=="yes" goto sortout
set write=%black%
if /i "%black%"=="1597532648" set write=[ NOTHING ]
echo echo %nickname% (%time:~0,8%): %write% >> "Chats\%savenr%-%nickname%_%loadprofile%.bat"

:sortout
REM Schimpfwoerter aussortieren
if /i "%black%"=="ja" set black=nein
set konter=RESET
if /i "%dontmad%"=="yes" goto overreppruef
if /i %nowreputation% LEQ 0 set black=ja&goto oversayblack
:overreppruef
call echo !random! >nul
set /a smileyrep=3*!random!/32767
echo "%black%"|findstr /i ":">nul && set /a nowreputation=%nowreputation%+%smileyrep%

echo "%black%"|findstr /i "1597532648">nul && set black=ja&&set konter=0&&set blackword=Empty

echo "%black%"|findstr /i "depp">nul && set black=ja&&set blackword=Depp
echo "%black%"|findstr /i "schlampe">nul && set black=ja&&set blackword=Schlampe
echo "%black%"|findstr /i "verpiss">nul && set black=ja&&set blackword=verpiss
echo "%black%"|findstr /i "vapiss">nul && set black=ja&&set blackword=vapiss
echo "%black%"|findstr /i "maul">nul && set black=ja&&set blackword=Maul
echo "%black%"|findstr /i "fresse">nul && set black=ja&&set blackword=Fresse
echo "%black%"|findstr /i "spast">nul && set black=ja&&set blackword=Spast
echo "%black%"|findstr /i "spaggo">nul && set black=ja&&set blackword=Spaggo
echo "%black%"|findstr /i "arsch">nul && set black=ja&&set blackword=Arsch
echo "%black%"|findstr /i "wixxe">nul && set black=ja&&set blackword=Wixxe
echo "%black%"|findstr /i "fuck">nul && set black=ja&&set blackword=Fuck
echo "%black%"|findstr /i "fick">nul && set black=ja&&set blackword=Fick
echo "%black%"|findstr /i "hurre">nul && set black=ja&&set blackword=Hurre
echo "%black%"|findstr /i "hure">nul && set black=ja&&set blackword=Hure
echo "%black%"|findstr /i "krippel">nul && set black=ja&&set blackword=Krippel
echo "%black%"|findstr /i "anal">nul && set black=ja&&set blackword=Anal
echo "%black%"|findstr /i "stirb">nul && set black=ja&&set blackword=Stirb
echo "%black%"|findstr /i "leck">nul && set black=ja&&set blackword=leck
echo "%black%"|findstr /i "wichs">nul && set black=ja&&set blackword=wichs
echo "%black%"|findstr /i "abschaum">nul && set black=ja&&set blackword=Abschaum
echo "%black%"|findstr /i "fotze">nul && set black=ja&&set blackword=Fotze
echo "%black%"|findstr /i "warze">nul && set black=ja&&set blackword=Warze
echo "%black%"|findstr /i "walross">nul && set black=ja&&set blackword=Walross
echo "%black%"|findstr /i "fett">nul && set black=ja&&set blackword=fett
echo "%black%"|findstr /i "idiot">nul && set black=ja&&set blackword=Idiot
echo "%black%"|findstr /i "trottel">nul && set black=ja&&set blackword=Trottel
echo "%black%"|findstr /i "dumm">nul && set black=ja&&set blackword=Dumm
echo "%black%"|findstr /i "sex">nul && set black=ja&&set blackword=Sex
echo "%black%"|findstr /i "porn">nul && set black=ja&&set blackword=Porn
echo "%black%"|findstr /i "vagina">nul && set black=ja&&set blackword=Vagina
echo "%black%"|findstr /i "oral">nul && set black=ja&&set blackword=oral
echo "%black%"|findstr /i "nutte">nul && set black=ja&&set blackword=Nutte
echo "%black%"|findstr /i "nerv">nul && set black=ja&&set blackword=nerv
echo "%black%"|findstr /i "cum">nul && set black=ja&&set blackword=cum
echo "%black%"|findstr /i "inzest">nul && set black=ja&&set blackword=inzest
echo "%black%"|findstr /i "incest">nul && set black=ja&&set blackword=incest
echo "%black%"|findstr /i "fingern">nul && set black=ja&&set blackword=fingern
echo "%black%"|findstr /i "facial">nul && set black=ja&&set blackword=facial
echo "%black%"|findstr /i "fist">nul && set black=ja&&set blackword=Fist
echo "%black%"|findstr /i "penis">nul && set black=ja&&set blackword=Penis
echo "%black%"|findstr /i "hardcore">nul && set black=ja&&set blackword=Hardcore
echo "%black%"|findstr /i "scheis">nul && set black=ja&&set blackword=Scheis
echo "%black%"|findstr /i "ginger">nul && set black=ja&&set blackword=Ginger
echo "%black%"|findstr /i "bitch">nul && set black=ja&&set blackword=Bitch
echo "%black%"|findstr /i "bums">nul && set black=ja&&set blackword=Bums
echo "%black%"|findstr /i "schamhaar">nul && set black=ja&&set blackword=Schamhaar
echo "%black%"|findstr /i "sperma">nul && set black=ja&&set blackword=Sperma
echo "%black%"|findstr /i "sau">nul && set black=ja&&set blackword=Sau
echo "%black%"|findstr /i "schwein">nul && set black=ja && set blackword=Schwein
echo "%black%"|findstr /i "schwul">nul && set black=ja && set blackword=Schwul
echo "%black%"|findstr /i "schwucht">nul && set black=ja && set blackword=Schwuchtel

if /i "%black%"=="ja" set nowreputation=0
if /i "%dontmad%"=="yes" goto overblack2
if /i "%black%"=="ja" goto overblack
set black=nein

goto overblack2
:overblack
if /i "%konter%"=="0" set konter=Witzig bist mit deine leeren Nachrichten..&&goto notext
call echo !random! >nul
set /a konter=10*!random!/32767+1
if /i "%konter%"=="1" set konter=Fick dich Flachwichser
if /i "%konter%"=="2" set konter=Leck mich du Schwuchtel.
if /i "%konter%"=="3" set konter=Du kannst mich mal.
if /i "%konter%"=="4" set konter=Auf dein Niveau begeb ich mich nicht Idiot..
if /i "%konter%"=="5" set konter=Schreib mich ja nicht mehr an Arschloch
if /i "%konter%"=="6" set konter=Verpiss dich einfach. 
if /i "%konter%"=="7" set konter=Nerv nicht..
if /i "%konter%"=="8" set konter=Selten einen Spast wie dich erlebt
if /i "%konter%"=="9" set konter=Traurig, dass du nichts Besseres zu tun hast..
if /i "%konter%"=="10" set konter=Dein IQ gleicht auch einem Toastbrot
:notext
echo %loadprofile%: %konter% 
if /i "%blackword%"=="Empty" goto oversayblack
echo [ Blacklist-Eintrag '%blackword%' entdeckt. ]
:oversayblack
set blackword=RESET
set konter=RESET
set dontmad=yes
REM NICHT BLACK=NEIN, da sonst chat weiter geht
timeout 1 /NOBREAK >nul
echo.
echo ############### %loadprofile% ist offline ###############
type beep.txt
pause >nul
:overblack2