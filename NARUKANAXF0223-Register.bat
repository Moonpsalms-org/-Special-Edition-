@echo off
REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    title �}�ʤ뤫�ʡ�Special Edition By Moonpsalms-org
    echo �}�ʤ뤫�ʡ�Special Edition ע����޸����� By Moonpsalms-org
    echo Running with administrative privileges...
    echo=
    echo=
    echo �״δ���Ϸǰ���ƶ���Ϸ������ļ��У���Ҫ���д˽ű���
    echo ���������ʼ�޸�����
    pause >nul
    cd /d "%~dp0"
    if exist NarukanaXF0223.exe goto UpdateRegistry
    echo �뽫�˳��������NarukanaXF0223.exeͬһĿ¼�������У���������˳�...
    goto end
) else (
    echo ���Թ���Ա������У���������˳�...
    pause >nul
    exit
)

:UpdateRegistry
SET CurrentDir=%CD%
SET CurrentDir=%CurrentDir:\=\\%

REM ɾ���ɵ�ע�����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\XUSE_CORP\NarukanaXF0223" /f

REM �����µ�ע����ļ�
> ".\Update.reg" ECHO Windows Registry Editor Version 5.00
>>".\Update.reg" ECHO.
>>".\Update.reg" ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\XUSE_CORP]
>>".\Update.reg" ECHO.
>>".\Update.reg" ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\XUSE_CORP\NarukanaXF0223]
>>".\Update.reg" ECHO "HD"="%CurrentDir%\\HD\\"
>>".\Update.reg" ECHO "CD"="%CurrentDir%\\CD\\"
>>".\Update.reg" ECHO "PatchVersion"=dword:00010006
>>".\Update.reg" ECHO "install"="%CurrentDir%\\"

cls

REM �����µ�ע����ļ�
regedit /s ".\Update.reg"
"%windir%\regedit.exe" /s ".\Update.reg"
"%windir%\SysWoW64\regedit.exe" /s ".\Update.reg"

REM ɾ����ʱע����ļ�
del /F /Q ".\Update.reg"

echo �޸���ɣ���������˳�
:end
pause >nul
exit
