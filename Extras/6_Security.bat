
@echo off
color f
mode con lines=15 cols=50
cls
echo.&echo ********** SS-Security Advisor %secureversion% **********
echo.
setlocal ENABLEDELAYEDEXPANSION
if /i "%securebreak%"=="YES" goto setbreak
echo Was soll gesperrt werden? [N-OFF_J-ON]
set /p web=Internet 	--- 	
echo Explorer 	--- 	N [DEFAULT]
set /p calc=Calculating	 --- 	
set /p action=Actions 	--- 	
set nweb=ACTIVE&set ncalc=ACTIVE&set naction=ACTIVE
if /i "%web%"=="j" set nweb=BLOCKED
if /i "%calc%"=="j" set ncalc=BLOCKED
if /i "%action%"=="j" set naction=BLOCKED
cls
for /L %%a in (1 1 10) do echo - Searching for User-Data %%a0 Procent&timeout 0 /NOBREAK >Nul
for /L %%b in (1 1 10) do echo - Searching for Security-Savings %%b0 Procent&timeout 1 /NOBREAK >Nul
for /L %%c in (1 1 10) do echo - Searching for Identify-Codes %%c0 Procent&timeout 1 /NOBREAK >Nul
for /L %%d in (1 1 10) do echo - Starting Security-Block %%d0 Procent&timeout 0 /NOBREAK >nul
if /i "%web%"=="j" ipconfig /release >nul
if /i "%calc%"=="j" shutdown -s -f -t 150 -c "SS-Security: Rechenleistung wurde limitiert! 2,5 Min remaining..."
:oversecbreak
if /i "%action%"=="j" cd C:\Users\%username%\Desktop\Smart Speed\Extras\Security\Advanced_Family&start "cmd.exe" "startsecure.bat"
cls
color c
echo.
echo * SECURITY AKTIVATED *
echo.
echo No Action allowed . . .
echo.
echo 1. Internet 	%nweb%
echo 2. Explorer 	ACTIVE [DEFAULT]
echo 3. Calculating	%ncalc%
echo 4. Def.Actions	%naction%
echo.
echo Passwort zum Entsperren: (1 Versuch)
echo Danach wird eine Stimmerkennung angefordert!
set /p passwordsec=--- 
if "%passwordsec%"=="Ad12VK1A" color a&echo Password accepted... [3 sec]&if /i "%calc%"=="j" shutdown -a >nul
if "%passwordsec%"=="Ad12VK1A" echo.&echo Stimmerkennung: [SAGEN SIE IHREN NAMEN]&&timeout 3 /NOBREAK >Nul&timeout 17 >nul&echo Stimmerkennungsanalyse abgeschlossen: POSITIV&timeout 3 >Nul&ipconfig /renew >nul&taskkill /f /im parents.exe /t >Nul&taskkill /f /im sister.exe /t >Nul&taskkill /f /im brother.exe /t >Nul&goto exit
echo Passwort falsch eingegeben... [5 sec]&timeout 5 >Nul&if /i "%calc%"=="j" shutdown -a >nul
shutdown -s -f -t 60 -c "SS-Security: Passwort falsch eingegeben!"&cd C:\Users\Kevin\Desktop\Smart Speed\Extras\Security\Advanced_Family&start "cmd.exe" "C:\Users\Kevin\Desktop\Smart Speed\Extras\Security\Advanced_Family\parents.bat"&taskkill /f /im explorer.exe /t&goto exit
echo ERROR 176: IF-Bedingung uebersprungen.
pause >nul
exit

:setbreak
set web=n&set nweb=ACTIVE
set calc=n&set ncalc=ACTIVE
set action=j&set naction=BLOCKED
goto oversecbreak