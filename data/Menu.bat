@echo off
title Menu
cd ./button/
cls
Batbox /h 0
cd ../
del Update.txt
cd ./button/

:Loop
cls
Call Button  35 8 "    Installer    " 65 8 "      Tools      " 50 12 "PluginSuggestions" # Press
Getinput /m %Press% /h 70

if %errorlevel%==1 (call "../Installer-Menu.bat")
if %errorlevel%==2 (call "../Tools-Menu.bat")
if %errorlevel%==3 (call "../PluginSuggetions.bat")
goto Loop