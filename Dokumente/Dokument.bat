@echo off
cd Dokumente
color f
cls
title SMART SPEED %version% - Dokument Pruefer
echo.
echo *************** Dokument Pruefer ***************
echo.
set format=0
if not exist "%cd%\Ungedruckt\*.docx" set /a format=%format%+1
if not exist "%cd%\Ungedruckt\*.doc" set /a format=%format%+1
if not exist "%cd%\Ungedruckt\*.dotx" set /a format=%format%+1
if not exist "%cd%\Ungedruckt\*.xlsx" set /a format=%format%+1
if not exist "%cd%\Ungedruckt\*.pptx" set /a format=%format%+1
if not exist "%cd%\Ungedruckt\*.txt" set /a format=%format%+1
if "%format%"=="6" goto nein
set mode=SS-Dokumente vorhanden %version%
if exist "C:\users\%username%\desktop\smart speed\ExaktLogger.bat" call "C:\users\%username%\desktop\smart speed\ExaktLogger.bat"
echo ACHTUNG: Ungedruckte Dokumente vorhanden!
echo Moechten Sie diese drucken?
set /p print=--- 
if /i "%print%"=="nein" goto nein
if /i "%print%"=="n" goto nein
if /i "%print%"=="ja" start explorer.exe "%cd%\Ungedruckt"&goto ja
if /i "%print%"=="j" start explorer.exe "%cd%\Ungedruckt"&goto ja
echo.
echo ERROR 404
echo Option nicht gefunden!
timeout 8 >Nul
exit
:ja
echo.
echo Dokument/-e erfolgreich gedruckt? (Ja/Nein)
set /p printdoc=--- 
if /i "%printdoc%"=="ja" goto move
if /i "%printdoc%"=="j" goto move
goto nein

:move
xcopy /Q /-Y "%cd%\Ungedruckt\*.*" "%cd%\Gedruckt\*.*" >nul
erase /-P /F "%cd%\Ungedruckt\*.*" 
goto nein

:nein
cd ..