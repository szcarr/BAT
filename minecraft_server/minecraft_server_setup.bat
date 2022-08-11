@echo off

REM Script for downloading and setting up minecraft server on a windows computer. Location of server is in your documents folder.
REM Parameter in, is the name of the minecraft folder.
REM Program must be run in cmd.

REM del /s %USERPROFILE%\Documents\%1
set scriptlocation=%cd%

chdir /d %USERPROFILE%\Documents

mkdir %1
cd %1

REM Getting the minecraft_server.jar
powershell.exe -command "& Invoke-WebRequest -OutFile server.jar -Uri https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar"

java -Xmx1024M -Xms1024M -jar server.jar nogui

del eula.txt
echo eula=true > eula.txt

echo Server folder location: %cd%\%1

java -Xmx1024M -Xms1024M -jar server.jar nogui

chdir /d %scriptlocation%

pause