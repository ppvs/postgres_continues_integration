@echo off
for /f "delims=" %%x in (connection_string.txt) do set Build=%%x
rh --dt postgres --silent -c="%Build%" -r=https://github.com/itdoster/postgres_continues_integration.git --sqlfilesdirectory=scripts