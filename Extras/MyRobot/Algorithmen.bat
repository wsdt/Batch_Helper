if /i "%alreadydeclared%"=="yes" goto changelaune


REM Chatverlauf speichern, Datei erstellen
if /i "%notracing%"=="yes" goto calcnowrep
for /L %%a in (1 1 1000) do if not exist "Chats\%%a-%nickname%_%loadprofile%.bat" set savenr=%%a&&goto writein
:writein
echo echo User: %nickname% //--// Virtuelles Profil: %loadprofile% >> "Chats\%savenr%-%nickname%_%loadprofile%.bat"
echo echo Schwierigkeit: %schwierigkeit% >> "Chats\%savenr%-%nickname%_%loadprofile%.bat"
echo echo Start des Chats am %date% um %time:~0,8% >> "Chats\%savenr%-%nickname%_%loadprofile%.bat"
echo echo. >> "Chats\%savenr%-%nickname%_%loadprofile%.bat"

:calcnowrep
if /i "%notracing%"=="yes" set gesamtreputation=100
REM NowReputation
set nowreputationmax=100
set nowreputationmin=0 


REM Da 11 Launen 100/11=9,09 pro Laune als Intervall zu vergeben
REM 14,13,12,11,10,9,8,7,6,5,5 = 100 --> Höchste Zahlen sind schlechte Launen wenn GesRep unter 50 sonst umgekehrt. --> Laufend dazu gezählt. Prozentuelle Wahrscheinlichkeit
if /i %gesamtreputation% LEQ 5 set bgl11=25&set bgl4=38&set bgl7=50&set bgl1=61&set bgl3=71&set bgl9=80&set bgl6=88&set bgl2=95&set bgl8=100&set bgl5=100&set bgl10=100&goto calclaunerep
if /i %gesamtreputation% LEQ 10 set bgl11=20&set bgl4=33&set bgl7=45&set bgl1=56&set bgl3=66&set bgl9=75&set bgl6=83&set bgl2=90&set bgl8=96&set bgl5=99&set bgl10=100&goto calclaunerep
if /i %gesamtreputation% LEQ 25 set bgl11=17&set bgl4=30&set bgl7=42&set bgl1=53&set bgl3=63&set bgl9=72&set bgl6=80&set bgl2=87&set bgl8=93&set bgl5=98&set bgl10=100&goto calclaunerep
if /i %gesamtreputation% LEQ 50 set bgl11=14&set bgl4=27&set bgl7=39&set bgl1=50&set bgl3=60&set bgl9=69&set bgl6=77&set bgl2=84&set bgl8=90&set bgl5=95&set bgl10=100&goto calclaunerep
if /i %gesamtreputation% LEQ 75 set bgl11=5&set bgl4=10&set bgl7=16&set bgl1=23&set bgl3=31&set bgl9=40&set bgl6=50&set bgl2=61&set bgl8=73&set bgl5=86&set bgl10=100&goto calclaunerep
if /i %gesamtreputation% LEQ 85 set bgl11=1&set bgl4=5&set bgl7=11&set bgl1=18&set bgl3=26&set bgl9=35&set bgl6=45&set bgl2=56&set bgl8=68&set bgl5=81&set bgl10=100&goto calclaunerep
if /i %gesamtreputation% LEQ 93 set bgl11=0&set bgl4=3&set bgl7=9&set bgl1=16&set bgl3=24&set bgl9=33&set bgl6=43&set bgl2=54&set bgl8=66&set bgl5=79&set bgl10=100&goto calclaunerep
if /i %gesamtreputation% GTR 100 echo ERROR ####: GesRep ueber 100.&timeout 10 >Nul&exit
if /i %gesamtreputation% GEQ 94 set bgl11=0&set bgl4=1&set bgl7=7&set bgl1=14&set bgl3=22&set bgl9=31&set bgl6=41&set bgl2=52&set bgl8=64&set bgl5=77&set bgl10=100&goto calclaunerep
:calclaunerep
REM Bei Schwierigkeitsgrad während des Chats werden bei negativen Antworten schneller Punkte abgezogen, aber NICHT mehr bei positiven dazu gezählt. 
if /i %laune% LEQ %bgl11% set nowreputation=0&set laune=11&goto breaksetlaune
if /i %laune% LEQ %bgl4% set nowreputation=2&set laune=4&goto breaksetlaune
if /i %laune% LEQ %bgl7% set nowreputation=5&set laune=7&goto breaksetlaune
if /i %laune% LEQ %bgl1% set nowreputation=10&set laune=1&goto breaksetlaune
if /i %laune% LEQ %bgl3% set nowreputation=15&set laune=3&goto breaksetlaune
if /i %laune% LEQ %bgl9% set nowreputation=20&set laune=9&goto breaksetlaune
if /i %laune% LEQ %bgl6% set nowreputation=25&set laune=6&goto breaksetlaune
if /i %laune% LEQ %bgl2% set nowreputation=30&set laune=2&goto breaksetlaune
if /i %laune% LEQ %bgl8% set nowreputation=35&set laune=8&goto breaksetlaune
if /i %laune% LEQ %bgl5% set nowreputation=45&set laune=5&goto breaksetlaune
if /i %laune% LEQ %bgl10% set nowreputation=50&set laune=10&goto breaksetlaune
:breaksetlaune
if /i "%schwierigkeit%"=="assi" set /a nowreputation=%nowreputation%*2-%nowreputation%/10
if /i "%schwierigkeit%"=="leicht" set /a nowreputation=(%nowreputation%*3)/2
REM Normal hat keine Änderungen
if /i "%schwierigkeit%"=="schwer" set /a nowreputation=(%nowreputation%*2)/3
if /i "%schwierigkeit%"=="brutal" set /a nowreputation=%nowreputation%/2

REM Nowreputationstart wird nur für den Highscore deklariert. 
set nowreputationstart=%nowreputation%

:changelaune
REM Laune bestimmen
set launesmiley=
set wmgaskanswerpc=RESET
set wmgask=RESET
if /i "%laune%"=="11" set launetext=Hassen&REM KEINE ANTWORT 
if /i "%laune%"=="1" set launetext=Schlecht&set begr=heil&set launeantwort=Nicht so gut, aber schon ok und bei dir?&set wmg=Bett liegen du&set wmgask=Was machsh?&set wmgaskanswerpc=Bett liegen
if /i "%laune%"=="2" set launetext=Gut&set begr=Hi :-)&set launesmiley=:)&set launeantwort=Passt eig alles bei dir? %launesmiley%&set wmg=Tvn du?&set wmgask=Was machst grad? %launesmiley%&set wmgaskanswerpc=Tvn
if /i "%laune%"=="3" set launetext=Muede&set begr=He&set launeantwort=Nur voll muede du?&set wmg=Zaehneputzen du&&set wmgask=Was tust?&set wmgaskanswerpc=Zaehneputzen
if /i "%laune%"=="4" set launetext=Wuetend&set begr=Hab koa Lust zu schreiben&set launeantwort=Bin stinksauer nerv nicht!&set wmg=..&&set wmgask=Dir scheint wohl langweilig zu sein..&set wmgaskanswerpc=..
if /i "%laune%"=="5" set launetext=Verliebt&set begr=He :-*&set launeantwort=bestens *-* dir?&set wmg=Film schaun mitn Freund du?&set launesmiley=:*&set wmgask=Was tust grad?%launesmiley%&set wmgaskanswerpc=Film shaun mitn Freund
if /i "%laune%"=="6" set launetext=Gleichgueltig&set begr=Heile&set launeantwort=Gut danke&set wmg=nit viel du&set wmgask=Was machsh&set wmgaskanswerpc=nit viel
if /i "%laune%"=="7" set launetext=Depressiv&set begr=He :-/&set launeantwort=Viel zu viel.. bei dir&set wmg=Nachdenken du??&set wmgask=Was machsh grad??&set wmgaskanswerpc=Nachdenken
if /i "%laune%"=="8" set launetext=Erleichtert&set begr=Seas :-D&set launeantwort=Passt alles :D bei dir?&set wmg=Fahr zu Kollegn du? :-)&set launesmiley=:S&set wmgask=Was tust? %launesmiley%&set wmgaskanswerpc=Fahr zu Kollegn
if /i "%laune%"=="9" set launetext=Gestresst&set begr=Jo&set launeantwort=Gut warum?&set wmg=Muss mi herrichten. A Kollegin holt mi glei ab du?&set wmgask=Was machshn grad?&set wmgaskanswerpc=Muss mi herrichten. A Kollegin holt mi glei ab
if /i "%laune%"=="10" set launetext=Perfekt&set begr=He %nickname% :-D&set launeantwort=Super dir? :)&set wmg=Eig nur Musik hoern du? :-D&set launesmiley=:D&set wmgask=Was duata? %launesmiley%&set wmgaskanswerpc=Eig nur Musik hoern :D

if /i %laune% LEQ 4 set smalltalkstop=Was hoerst gern fuer Zeug? %launesmiley%&goto knowledgelernen
if /i %laune% LEQ 8 set smalltalkstop=Was fuer a Musik hoerst gern? %launesmiley%&goto knowledgelernen
if /i %laune% LEQ 11 set smalltalkstop=Was hoerst du fuer Musik? %launesmiley%&goto knowledgelernen
if /i "%laune%"=="RESET" echo ERROR ####: Laune nicht bestimmt. [RESET]&timeout 5 /NOBREAK >nul&exit
if /i %laune% LEQ 0 echo ERROR ####: Laune fehlerhaft bestimmt [kleiner 0]&timeout 5 /NOBREAK >Nul&exit
if /i %laune% GEQ 12 echo ERROR ####: Laune fehlerhaft bestimmt [groeser 12]&timeout 5 /NOBREAK >Nul&exit
echo ERROR ####: Hier solltest du gar nicht hin...&timeout 5 /NOBREAK >NUL&exit
:knowledgelernen
REM Kennenlernen per Profilbestimmung
if /i "%laune%"=="1" set nomusiklike=Kenn i leider nit, aber egal&set musikalletext=Alles is ja die Beste Antwort haha&set musikkatext=Toll, wieder einer ohne eigene Meinung. &set musikbeide=Hat was, ist hammer geil&set nomusikbeide=Nicht meins, aber jedem seines. &set loadmusik=Das ist eins der besten Lieder. 
if /i "%laune%"=="2" set nomusiklike=Diese Musikrichtung kenn ich gar nicht %launesmiley%&set musikalletext=Also momentan eher allgemein %launesmiley%&set musikkatext=Wirst wohl etwas gern hoeren.&set musikbeide=%bothmusik% habn was ja %launesmiley%&set nomusikbeide=Ist leider eher nicht mein Geschmack %launesmiley%&set loadmusik=Das ist eines meiner Lieblingslieder. 
if /i "%laune%"=="3" set nomusiklike=Scho wieder was Neues, i verpenn alles..&set musikalletext=Alles aha ok haha&set musikkatext=Keinen Plan von der Welt. &set musikbeide=Jo is echt geil&set nomusikbeide=Nichts dabei fuer mich&set loadmusik=Des is mei Lieblingslied..
if /i "%laune%"=="4" set nomusiklike=Erfind lei irgendwelche Musikrichtungen, Spast&set musikalletext=Haha geil, entscheid di du Opfer..&set musikkatext=Zu dumm um Musik zu hoeren, nice&set musikbeide=Man kanns losn, ja&set nomusikbeide=Wah, de Scheisse hoerst da an ahahah&set loadmusik=Ds Lied hat was.. 
if /i "%laune%"=="5" set nomusiklike=Kenn ich gar nit %launesmiley%&set musikalletext=Versteh nicht wie man alles losen kann aber ok %launesmiley%&set musikkatext=Komm scho, irgendwas wirds wohl geben&set musikbeide=%bothmusik% machen suechtig %launesmiley%&set nomusikbeide=Nicht meins aber ok %launesmiley%&set loadmusik=Des Lied is geil %launesmiley%
if /i "%laune%"=="6" set nomusiklike=kenn i nit %launesmiley%&set musikalletext=Haha ok wenn du meinst %launesmiley%&set musikkatext=Hmm ok aber sag etz wirklich&set musikbeide=Nice haha, %bothmusik% 4-ever %launesmiley%&set nomusikbeide=Scheisse ahoi haha, sry aber is so&set loadmusik=(Y)  
if /i "%laune%"=="7" set nomusiklike=Mal wieder was Neues&set musikalletext=I wuerds gern wissen, nix alle&set musikkatext=Wieder einer ohne Plan&set musikbeide=Is cool ja &set nomusikbeide=Na, sowas dat i ma nie anhoeren&set loadmusik=Ds is eins der Besten
if /i "%laune%"=="8" set nomusiklike=Klingt geil, hab i aber no nie glosn %launesmiley%&set musikalletext=A ok versteh schon %launesmiley%&set musikkatext=Wirst wohl a Meinung haben %launesmiley%&set musikbeide=Haha %bothmusik% sind echt geil %launesmiley%&set nomusikbeide=Kann i leider nit zustimmen %launesmiley%&set loadmusik=I find des Lied guat %launesmiley%
if /i "%laune%"=="9" set nomusiklike=Kenn i nit, aber klingt interessant&set musikalletext=Wirst wohl was lieber moegen&set musikkatext=Die eigene Meinung hast auch verloren oder?&set musikbeide=Is sau geil ja&set nomusikbeide=Sowas hoer i ma nit an..&set loadmusik=Des Lied is mega 
if /i "%laune%"=="10" set nomusiklike=Is sicher a geile Mukke %launesmiley%&set musikalletext=Aso ist des %launesmiley%&set musikkatext=Meinung erwuenscht %launesmiley%&set musikbeide=%bothmusik% sind einfach es Beste %launesmiley%&set nomusikbeide=Kann das nicht mehr hoeren %launesmiley%&set loadmusik=Dem Lied koennt i 1000mal losn %launesmiley%

REM Bei Smiley nach ':' in text suchen. Ob profil auch smileys schreibt und so antworten soll.  