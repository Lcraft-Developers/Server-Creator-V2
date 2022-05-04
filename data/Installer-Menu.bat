@echo off
title Menu
cd ./button/
cls
Batbox /h 0

:Loop
cls
Call Button  35 8 "BungeeCord" 65 8 "Paper" 35 12 "Spigot" 65 12 "Waterfall" 35 16 "Purpur" 65 16 "Velocity" 35 20 "Back" # Press
Getinput /m %Press% /h 70

if %errorlevel%==1 (call "../../installer/bungeecord.bat")
if %errorlevel%==2 (call "../../installer/paper.bat")
if %errorlevel%==3 (call "../../installer/spigot.bat")
if %errorlevel%==4 (call "../../installer/waterfall.bat")
if %errorlevel%==5 (call "../../installer/purpur.bat")
if %errorlevel%==6 (call "../../installer/velocity.bat")
if %errorlevel%==7 (call "../Menu.bat")
goto Loop