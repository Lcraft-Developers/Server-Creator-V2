@echo off
title Menu
cd ./button/
cls
Batbox /h 0

:Loop
cls
Call Button  35 8 "Stop VMs" 65 8 "  Exit  " # Press
Getinput /m %Press% /h 70

if %errorlevel%==1 (call "../../tools/stop-vms.bat")
if %errorlevel%==2 (call "../Menu.bat")
goto Loop