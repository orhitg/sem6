
@ECHO off

if '%1'=='' GOTO Error

flex %~f1
if NOT '%errorlevel%'=='0' GOTO Error

g++ lex.yy.c
if NOT '%errorlevel%'=='0' GOTO Error

START a.exe
GOTO End

:Error
ECHO Error!!!
GOTO End

:End

