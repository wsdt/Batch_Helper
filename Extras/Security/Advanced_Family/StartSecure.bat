@echo off
cd "C:\Users\Kevin\Desktop\Smart Speed\Extras\Security\Advanced_Family"
title SS-Secure
color fc
mode con lines=1 cols=15
tasklist 2>nul | find /I /N "parents.exe"2>nul
if "%ERRORLEVEL%"=="1" start "cmd.exe" "C:\users\%username%\desktop\smart speed\extras\security\advanced_family\parents.exe" >nul
tasklist 2>nul | find /I /N "sister.exe"2>nul
if "%ERRORLEVEL%"=="1" start "cmd.exe" "C:\users\%username%\desktop\smart speed\extras\security\advanced_family\sister.exe" >nul
tasklist 2>nul | find /I /N "brother.exe"2>nul
if "%ERRORLEVEL%"=="1" start "cmd.exe" "C:\users\%username%\desktop\smart speed\extras\security\advanced_family\brother.exe" >nul
exit