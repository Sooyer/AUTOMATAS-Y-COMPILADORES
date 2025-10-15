%option noyywrap
%{
    #include <stdio.h>
    FILE *yyin;
%}

RESERVADAS (int|float|double|char|void|bool|if|else|for|while|do|switch|case|break|continue|return|class|struct|public|private|protected|virtual|const|static|new|delete|try|catch|throw|using|namespace|include|iostream|std|main)
VARIABLE [a-zA-Z_][a-zA-Z0-9_]*
ENTERO          [0-9]+
FLOTANTE        {ENTERO}"."{ENTERO}
%%
{RESERVADAS}     { printf("PALABRA RESERVADA: %s\n", yytext); }
{VARIABLE} { printf("IDENTIFICADOR (Variable): %s\n", yytext); }
{FLOTANTE}      { printf("CONSTANTE FLOTANTE: %s\n", yytext); }
{ENTERO}        { printf("CONSTANTE ENTERA: %s\n", yytext); }
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
