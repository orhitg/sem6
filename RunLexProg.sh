#!/bin/bash

#lex
lex $1
g++ lex.yy.c -ll
./a.out
