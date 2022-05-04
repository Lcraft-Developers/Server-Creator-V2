@echo off
title Menu
cd ./button/
cls
Batbox /h 0

:Loop
cls
Call Button  35 8 "LuckPerms" 65 8 "Holographic Displays" 50 30 "  Exit  " # Press
Getinput /m %Press% /h 70

if %errorlevel%==1 (start "" https://luckperms.net)
if %errorlevel%==2 (start "" https://dev.bukkit.org/projects/holographic-displays)
if %errorlevel%==3 (call "../Menu.bat")
goto Loop