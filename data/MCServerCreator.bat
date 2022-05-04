@echo off
title Creation...

:start
curl https://raw.githubusercontent.com/Lcraft-Developers/Server-Creator-V2/main/data/version.txt -o nextver.txt
set /p v=<version.txt
set /p nv=<nextver.txt
del nextver.txt
if exist ./Update.txt call ./Menu.bat
cd ../
if not "%v%"=="%nv%" call ./Updater.bat
cd ./data/
call ./Menu.bat
exit