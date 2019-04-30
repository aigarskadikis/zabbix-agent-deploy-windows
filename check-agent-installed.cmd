@echo off
cls
setlocal EnableDelayedExpansion

echo.
echo Zabbix agent:

sc query "Zabbix Agent" > nul 2>&1
if !errorlevel!==0 (
echo.
echo .. is installed as service
sc query "Zabbix Agent" | findstr "RUNNING" > nul 2>&1
if !errorlevel!==0 (
echo.
echo .. already running
)

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Zabbix Agent" > nul 2>&1
if !errorlevel!==0 (
echo.
echo .. location and config:
if exist "%~dp0sed.exe" reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Zabbix Agent" /v ImagePath | findstr "ImagePath" | sed "s/^.*REG_EXPAND_SZ[ \t]*//"
if not exist "%~dp0sed.exe" reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Zabbix Agent" /v ImagePath | findstr "ImagePath"
)

) else echo .. not installed as service

if exist "%systemroot%\System32\tasklist.exe" (
TASKLIST | findstr "zabbix_agentd.exe" > nul 2>&1
if !errorlevel!==0 (
echo.
echo .. agent running currently as an process
TASKLIST | findstr "zabbix_agentd.exe"
)
)

endlocal
