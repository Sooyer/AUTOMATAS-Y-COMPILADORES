%option noyywrap
%{
    #include <stdio.h>
    FILE *yyin;
%}

COMENT1 "//".*
COMENT2 "/\\*([^*]|\\*+[^*/])*\\*+/"

%%
{COMENT1}   { printf("%s\n", yytext); }
{COMENT2}   { printf("%s\n", yytext); }
[ \t\n]+    ;
.           ;
%%

int main(){
    char name[] = "codigo.cpp";
    FILE *archivo = fopen(name, "r");

    if (!archivo) {
        printf("Error al abrir el archivo %s\n", name);
        return 1;
    }

    yyin = archivo;
    yylex();

    fclose(archivo);
    return 0;
}
