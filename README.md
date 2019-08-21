# Compilers
Sample LEX and YACC codes.
 
note:Codes are named as per the numbers given below in the corresponding folder.

## LEX Problems
1. LEX program to do the following. Given an input English sentence, 
	a. Identify and print the words that start with a ‘k’.
	b. Identify and print the words that begins with a vowel. 
	c. Identify, count and print the words that has a ‘p’ and a ‘t’. 
	d. Identify, count and print words that has at least 2 vowels. 
	e. Count and print the number of vowels. 
2. LEX program, that takes an input ‘C’ file and replaces, the C input/output statements, (printf, scanf) with C++ I/O statements (cout, cin).
3. LEX program that converts a ‘for’ construct in C to a ‘while’ construct. All possible declarations of ‘for’ should be handled. 

### Run
```
lex filename.lex
g++ lex.yy.c -lfl
./a.out
```

## YACC Problems
1. Evaluate POSTFIX expression
2. Validate the 'for' and 'nested for' programming synatax
3. Validate the if-then-else syntax
4. Validate the switch-case syntax
5. Validate the #define macro syntax

### Run
```
lex filename.lex
yacc filename.yacc
g++ y.tab.c -lfl
./a.out
```
