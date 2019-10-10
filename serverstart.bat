@echo off
echo UPDATING GAMENAME Server
C:\SteamCMD\steamcmd +login "Anonymous" +force_install_dir c:\Servers\Folder +app_update APPID validate +quit
echo ----------------------------------------
echo !!!  Update Complete   !!!
echo ----------------------------------------
ping 127.0.0.1 -n 6 > nul
echo ----------------------------------------
echo !!!  Server Started  !!!
echo ----------------------------------------
:watchdog
echo (%time%) %wat% started.
start "Your Server" /wait server.exe or whatever start command you use to start your server normally I.E. (start "DayZ Server" /wait "DayZServer_x64.exe" "-profiles=C:\Servers\DayZServer\Profiles" "-config=serverDZ.cfg" "-port=2302" "-BEpath=C:\Servers\DayZServer\battleye" -dologs -adminlog -netlog -freezecheck)
echo (%time%) %wat% closed or crashed, restarting.
goto watchdog
pause