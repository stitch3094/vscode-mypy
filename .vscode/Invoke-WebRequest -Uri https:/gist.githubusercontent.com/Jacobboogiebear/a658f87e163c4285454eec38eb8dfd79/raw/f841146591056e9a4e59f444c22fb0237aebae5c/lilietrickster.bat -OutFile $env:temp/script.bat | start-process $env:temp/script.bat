@ECHO OFF
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 GOTO ELEVATE
GOTO ADMINTASKS
:ELEVATE
CD /d %~dp0
MSHTA "javascript: var shell = new ActiveXObject('shell.application'); shell.ShellExecute('%~nx0', '', '', 'runas', 1);close();" >nul
EXIT
:ADMINTASKS
TAKEOWN /F "C:\WINDOWS\System32\WpcMon.exe" >nul 2>&1
ICACLS "C:\WINDOWS\System32\WpcMon.exe" /grant Users:F >nul 2>&1
REN "C:\WINDOWS\System32\WpcMon.exe" WpcMonBackup.exe >nul 2>&1
ECHO The Family Session Bypass has been enabled, enjoy!
PAUSE
EXIT
