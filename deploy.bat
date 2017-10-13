@echo off
for /f "delims=" %%x in (connection_string.txt) do set Build=%%x
rh --dt=postgres --silent -c="%Build%" -t=true -r=https://github.com/itdoster/bd_transfer --sqlfilesdirectory=scripts
if "%errorlevel%"=="0" cls &Echo Success.
if "%errorlevel%"=="1" cls &Echo Fail
endlocal