@echo off
set "y=[93m"
set "f=[0m"

openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo You are not running as Administrator...
    echo This batch cannot do its job without elevation!
    echo.
    echo Right-click and select %y%'Run as Administrator'%f% and try again...
    echo.
    echo Press any key to exit . . .
    pause >nul
    exit
)

set "recon=y"
::discord: hydragotcash
::youtube: @hydragotcash
::https://github.com/hydragotcash
echo Recon Optimizer is FREE and not for sale. If you bought this from someone you got scammed and request a refund.
echo Recon Optimizer official page: https://github.com/hydragotcash/ReconTweaks
timeout /t 1 >nul
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion
echo %y%Preparing...%f%
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\ApplicationManagement" /v "AllowGameDVR" /t REG_DWORD /d "0" /f
cd /d "%~dp0src" || exit /b
echo %cd%
echo %username%@%computername%
set "src=%cd%"
set "userdesktop=%userprofile%\Desktop"
timeout /t 1

title ReconOptimizer // @hydragotcash
cls

:light_or_dark
cls
echo %y%Do you want Light mode or Dark mode?%f%
echo %y%=================%f%
echo %y%1. Light Mode%f%
echo %y%2. Dark Mode%f%
echo %y%=================%f%
choice /c 12 /n /m ""

if %errorlevel% equ 2 set "theme_mode=DARK" & goto remove_defender
if %errorlevel% equ 1 set "theme_mode=LIGHT" & goto remove_defender

:remove_defender
cls
echo %y%Remove Defender?%f%
echo %y%=================%f%
echo %y%1. Yes%f%
echo %y%2. No%f%
echo %y%=================%f%
choice /c 12 /n /m ""

if %errorlevel% equ 2 set "remove_defender=No" & goto remove_edge
if %errorlevel% equ 1 set "remove_defender=Yes" & goto remove_edge

:remove_edge
cls
echo %y%Remove Edge?%f%
echo %y%=================%f%
echo %y%1. Yes%f%
echo %y%2. No%f%
echo %y%=================%f%
choice /c 12 /n /m ""

if %errorlevel% equ 2 set "remove_edge=No" & goto remove_store
if %errorlevel% equ 1 set "remove_edge=Yes" & goto remove_store

:remove_store
cls
echo %y%Remove Microsoft Store?%f%
echo %y%=================%f%
echo %y%1. Yes%f%
echo %y%2. No%f%
echo %y%=================%f%
choice /c 12 /n /m ""

if %errorlevel% equ 2 set "remove_store=No" & goto finish
if %errorlevel% equ 1 set "remove_store=Yes" & goto finish

:finish
if /i "%theme_mode%"=="LIGHT" (
    Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "1" /f
    Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "1" /f
) else (
    Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f
    Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f
)

if /i "%remove_defender%"=="Yes" (
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableSpecialRunningModes" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d "0" /f
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /f
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v "ForceUpdateFromMU" /t REG_DWORD /d "0" /f
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "DisableBlockAtFirstSeen" /t REG_DWORD /d "1" /f
)

if /i "%remove_edge%"=="Yes" (
taskkill /f /im msedge.exe
rd /s /q "C:\Program Files (x86)\Microsoft\Edge"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeCore"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeWebView"
rd /s /q "C:\Program Files (x86)\Microsoft\Temp"
)

if /i "%remove_store%"=="Yes" (
    echo Removing Microsoft Store...
    PowerShell -Command "Get-AppxPackage -AllUsers *windowsstore* | Remove-AppxPackage"
)

if /i %recon%=="y" (
   goto tweaks
)

:tweaks
start tweaks.bat
exit
