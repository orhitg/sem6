#!/bin/bash
yacc -d $1
lex $2
g++ y.tab.c lex.yy.c -ll
./a.out
