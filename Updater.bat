@echo off
goto menu

:menu
echo Do you want to update?
echo (J) Yes (N) No
set /p a=Update: 
if "%a%"=="y" goto create
cd ./data
echo No > Update.txt
call ./MCServerCreator.bat

:create
curl -o Files.zip "https://codeload.github.com/Lcraft-Developers/Server-Creator/zip/refs/heads/main"
tar -xf Files.zip
echo Enter N
xcopy ".\Server-Creator-main\*.*" ".\" /-Y /E
del "Files.zip" /s /q /f
del ".gitattributes" /s /q /f
del "Server-Creator-main" /s /q /f
FOR /D %%p IN (".\Server-Creator-main\*.*") DO rmdir "%%p" /s /q
rmdir "Server-Creator-main" /s /q