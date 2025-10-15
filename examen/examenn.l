%option noyywrap
%{
    #include <stdio.h>
    FILE *yyin;
    int cont = 0;
%}

RESERVADAS (cout|cin|int|float|double|char|void|bool|if|else|for|while|do|switch|case|break|continue|return|class|struct|public|private|const|static|new|delete|try|catch|throw|using|namespace|include|iostream|std|main)
COMENT1 "//".*
COMENT2 "/\\*([^*]|\\*+[^*/])*\\*+/"
VARIABLE [a-zA-Z_][a-zA-Z0-9_]*
NUMERIC [0-9]+(\.[0-9]+)?
ARIT [\+\-\*/%]
OP_LOGICOS (&&|\|\||!|<=|>=|==|!=|<|>)
S_ESPECIALES [\(\)\{\}\[\];,\.]|<<|>>


%%

{RESERVADAS}     { printf("PALABRA RESERVADA: %s\n", yytext); }
{COMENT1}        { cont++; printf("COMENTARIO: %s\n", yytext); }
{COMENT2}        { cont++; printf("COMENTARIO: %s\n", yytext); }
{VARIABLE}       { printf("VARIABLES: %s\n", yytext); }
{NUMERIC}        { printf("CONSTANTE NUMERICA: %s\n", yytext); }
{ARIT}           { printf("OPERADOR ARITMETICO: %s\n", yytext); }
{OP_LOGICOS}     { printf("OPERADOR LOGICO: %s\n", yytext); }
{S_ESPECIALES}   { printf("SIMBOLO ESPECIAL: %s\n", yytext); }
[ \t\n]+         ; 

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

    printf("\nNumero de cometarios: %d\n", cont);

    fclose(archivo);
    return 0;
}


