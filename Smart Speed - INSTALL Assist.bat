@echo off
set status=on
mode con lines=30 cols=90
set installversion=1.0
title SMART SPEED - INSTALL ASSISTENT %installversion%
color 0f
set mode=SS-INSTALL Assist. %installversion%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
echo.
echo *************** INSTALL ASSISTANT ***************
echo.
echo Wohin soll SMART SPEED installiert werden? (Ohne \ abschliessen!)
echo Dateipfad angeben! Bsp.: C:\users\%username%\desktop = STANDARD 
echo Druecke ENTER um die Standard Einstellung zu verwenden. 
set /p installpfad=--- 
if /i "%installpfad%"=="" set installpfad=C:\users\%username%\desktop
if exist "%cd%\Read Me.txt" ren "%cd%\Read Me.txt" "Read Me_OLD.txt"
echo Anleitung - Read Me >> "%cd%\Read Me.txt"
echo cd "%installpfad%\Smart Speed\" >> "%cd%\Read Me.txt"
echo 1. Oben angefuehrte Zeile in die Datei "Smart Speed.bat" in die 2. Zeile einfuegen bzw. Pfad ersetzen >> "%cd%\Read Me.txt"
echo    cd "PFAD" >> "%cd%\Read Me.txt"
echo 2. Speichern und schliessen! >> "%cd%\Read Me.txt"
cd ..
xcopy /E /I /H "%cd%\Smart Speed\" "%installpfad%\SMART SPEED\"
if exist "C:\users\%username%\desktop\smart speed\smart speed.bat" reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v Smart_Speed /t REG_SZ /d "C:\users\%username%\desktop\smart speed\smart speed.bat" >nul
cls
echo.
echo SMART SPEED wurde installiert. . .
pause >nul
exit