/* 135200 - Ambunya, Michelle Were */

/*** Definition Section has one header file and one variable
which can be accessed inside yylex()
and main() ***/
%{
#include <stdio.h>
int count = 0;
%}
 
/*** Rule Section has six rules, 
- first rule matches with a combination of letters forming a word, 
- second rule matches with contracted words such as don't, couldn't... ,
- third rule matches with a number/combination of numbers,
- fourth rule matches with a combination of numbers and letters forming a word, 
- fifth rule matches with any other character such as spaces and
- sixth rule does not take input after the enter***/
%%
[a-zA-Z]+ {printf("%s\n", yytext);
       count++;}
[a-zA-Z]+'[a-zA-Z]{1,2} {printf("%s\n", yytext);
	count++;}
[0-9]+ {printf("%s\n", yytext);
       count++;}
[0-9]+[a-zA-Z]+ {printf("%s\n", yytext);
       count++;}
.     /* ignores and moves to the next characters*/
\n    {return 0;}
%%
 
/*** Code Section prints the tokens/words 
present in the given input sentence***/
int yywrap(){}
int main(){
 
// Explanation:
// yywrap() - wraps the above rule section
/* yyin - takes the file pointer
          which contains the input*/
/* yylex() - this is the main flex function
          which runs the Rule Section*/
// yytext is the text in the buffer
 
// Uncomment the lines below
// to take input from file
// FILE *fp;
// char filename[50];
// printf("Enter the filename: \n");
// scanf("%s",filename);
// fp = fopen(filename,"r");
// yyin = fp;
 
printf("\n Type a sentence : \n");
yylex();
return 0;
}
