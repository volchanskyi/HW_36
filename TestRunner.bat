@ECHO ON
SET GITHUB=volchanskyi
SET WS_DIR=projects\Workspace
SET REPO=HW_36
SET VERSION=0.1
:: =====================================================================================
D:
IF "%JAVA_HOME%" == "" GOTO EXIT_JAVA
IF "%M2%" == "" GOTO EXIT_MVN
CALL git --version > nul 2>&1
IF NOT %ERRORLEVEL% == 0 GOTO EXIT_GIT
GOTO NEXT
:NEXT
IF NOT EXIST D:\%WS_DIR% GOTO NO_WORKSPACE
IF EXIST D:\%WS_DIR%\%REPO% RMDIR /S /Q D:\%WS_DIR%\%REPO%
CD D:\%WS_DIR%
git clone https://github.com/%GITHUB%/%REPO%.git

CD %REPO%
SLEEP 2
CALL mvn clean site -Dtest_suite=%1 -Dpassword=%2
GOTO END
:EXIT_JAVA
ECHO No Java installed
GOTO END
:EXIT_MVN
ECHO No Maven installed
GOTO END
:EXIT_GIT
ECHO No Git installed
GOTO END
:NO_WORKSPACE
ECHO %WS_DIR% is not exist
GOTO END
:END
CD\
pause

