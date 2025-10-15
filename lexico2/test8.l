%option noyywrap
%{
    #include <stdio.h>
    #include "tokenss.h"
%}

%%
(aplicar|calcular|clasificar|completar|construir|demostrar|desarrollar|emplear|ejecutar|ilustrar|implementar|interpretar|manipular|operar|organizar|preparar|resolver|transferir|usar|utilizar) { return TOKEN_BLOOM; }
[ \t\n]+    { /* Ignorar espacios, tabulaciones y saltos de línea */ }
.           { /* Ignorar cualquier otro carácter */ }
%%

int main(void)
{
    int token;
    while ((token = yylex())) {
        if (token == TOKEN_BLOOM)
            printf("verbo de la taxonomia de bloom categoría aplicación = %s\n", yytext);
    }
    return 0;
}
