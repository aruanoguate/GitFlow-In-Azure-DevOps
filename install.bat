ECHO OFF
mkdir %userprofile%\gitflow\
xcopy /E /Y modules %userprofile%\gitflow\modules\
xcopy /E /Y aliases %userprofile%\gitflow\aliases\
pushd %userprofile%\gitflow\
FOR /f %%A IN ('dir /b aliases') DO (
    FOR /f %%S IN ('dir /b aliases\%%A\*.sh') DO (
        CALL :PROCESS_SHELL %%A %%S
    )
)
popd
GOTO :eof

:PROCESS_SHELL
    SET aliasName=%1.%2
    SET aliasName=%aliasName:.sh=%
    SET filename='%CD%\aliases\%1\%2'
    SET aliasCmd="!func() { bash %filename% $@; }; func"
    SET gitCmd=git config --global alias.%aliasName% %aliasCmd%
    %gitCmd%
EXIT /B