%option noyywrap
%{
    #include <stdio.h>
    #include "tokenss.h"
%}

%%

[a-z]{2}[0-9]{6}@uaeh\.edu\.mx   { return TOKEN_EMAIL; }


%%

int main(void)
{
    int token;
    while (1) {
        token = yylex();
        if (token == TOKEN_EMAIL)
           printf("TOKEN_EMAIL = %s\n", yytext);
        if (token == 0)
            break;
    }
    return 0;
}
