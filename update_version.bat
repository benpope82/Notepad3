@ECHO OFF
SubWCRev . "src\Version_in.h" "src\Version_rev.h" -f
IF %ERRORLEVEL% NEQ 0 GOTO :NoSubWCRev
SubWCRev . "res\Notepad2.exe.manifest.conf" "res\Notepad2.exe.manifest" -f >NUL
IF %ERRORLEVEL% NEQ 0 GOTO :NoSubWCRev
SubWCRev . "distrib\res\full\setup.manifest.conf" "distrib\res\full\setup.manifest" -f >NUL
IF %ERRORLEVEL% NEQ 0 GOTO :NoSubWCRev
SubWCRev . "distrib\res\lite\setup.manifest.conf" "distrib\res\lite\setup.manifest" -f >NUL
IF %ERRORLEVEL% NEQ 0 GOTO :NoSubWCRev
GOTO :EOF

:NoSubWCRev
ECHO:NoSubWCRev, will use VERSION_REV=0
ECHO:#define VERSION_REV 0 >"src\Version_rev.h"
COPY /Y "res\Notepad2.exe.manifest.template" "res\Notepad2.exe.manifest"
COPY /Y "distrib\res\full\setup.manifest.template" "distrib\res\full\setup.manifest"
COPY /Y "distrib\res\lite\setup.manifest.template" "distrib\res\lite\setup.manifest"
