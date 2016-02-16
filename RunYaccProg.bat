
@ECHO off


if '%1'=='' 
GOTO Error


bison -y -d %~dpn1.y

if NOT '%errorlevel%'=='0' 
GOTO Error

flex  %~dpn1.l

if NOT '%errorlevel%'=='0' 
GOTO Error


g++ lex.yy.c  y.tab.c

if NOT '%errorlevel%'=='0' 
GOTO Error


START a.exe

GOTO End

:Error

ECHO Error!!!

GOTO End

:End

