@echo off
goto menu

:menu
del Update.txt
echo Do you want to update?
echo (J) Yes (N) No
set /p a=Update: 
if "%a%"=="y" goto create
if "%a%"=="j" goto create
if "%a%"=="Y" goto create
if "%a%"=="J" goto create
cd ./data
echo No > Update.txt
call ./MCServerCreator.bat

:create
curl -LJO https://github.com/Lcraft-Developers/Server-Creator-V2/archive/refs/heads/main.zip
tar -xf Server-Creator-V2-main.zip
echo Enter N
xcopy ".\Server-Creator-V2-main\*.*" ".\" /-Y /E
del "Server-Creator-V2-main.zip" /s /q /f
del ".gitattributes" /s /q /f
del "Server-Creator-V2-main" /s /q /f
FOR /D %%p IN (".\Server-Creator-V2-main\*.*") DO rmdir "%%p" /s /q
rmdir "Server-Creator-V2-main" /s /q
pause