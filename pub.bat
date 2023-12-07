@echo off
goto :init

rem https://stackoverflow.com/a/45070967
rem https://ss64.com/nt/if.html
rem https://ss64.com/nt/exit.html
rem https://ss64.com/nt/set.html
rem set /A var=val --> /A – This switch is used if the value needs to be numeric in nature
rem goto :eof -> exit sub-routine
rem :main is NOT automatically call
rem EXIT /b has the option to set a specific errorlevel, EXIT /b 0 for sucess, EXIT /b 1 (or greater) for an error. this option will exit only the script (or subroutine) but not CMD.EXE
rem EXIT without an ExitCode acts the same as goto:eof and will not alter the ERRORLEVEL

:init
    if "%~1" == "" (set "msg=automated-by-a-pub-bot") else (set "msg=%1")
    for /f %%i in ('git rev-parse HEAD') do set curver=%%i
    rem if NOT "%~1" == "" echo Too tired 
    echo *** All parameter initialized! 
    echo *** Current repository version: %curver%
    goto :main

:header
    echo ***                                        ***
    echo *** AUTO-PUBLISH BATCH CREATED BY LEOTRAN  ***
    echo *** Usage: pub.bat "long message"          ***
    echo *** No speical characters allowed          ***
    echo ***                                        ***
    echo.
    goto :eof

rem && -> only execute if previous command success
:main
    call :header 
    call :git_proc && goto :end

rem commandhere || echo what to do if error level ISN'T 0
rem commandhere && echo what to do if error level IS 0
:git_proc
    echo *** Calling git procedure ...
    (git add * & git commit -am %msg% & git pull origin master && git push origin master) || goto :err
    rem for /f %%i in ('git rev-parse HEAD') do set curver=%%i
    rem echo %curver%>.version
    echo *** All git job done!
    goto :eof

:err
    echo *** There're something WRONG with our commands. Please check!
    exit 1

:end
    echo *** All command execute SUCCESSFULLY! Exiting ...
    exit /B 0