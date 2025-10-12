%option noyywrap
%{
    #include <stdio.h>
    #include "tokenss.h"
%}

%%

[a-zA-Z][a-zA-Z0-9_]*    { return TOKEN_IDENTIFICADOR; }

%%

int main(void)
{
    int token;
    while (1) {
        token = yylex();
        if (token == TOKEN_IDENTIFICADOR)
           printf("TOKEN_IDENTIFICADOR = %s\n", yytext);
        if (token == 0)
            break;
    }
    return 0;
}
