%{
#include <stdio.h>

int total_lineas = 0;
int total_caracteres = 0;
int total_palabras = 0;
int cnt_inicia_ni = 0;
int cnt_inicia_num = 0;
int cnt_b_termina_to = 0;
int cnt_termina_jo = 0;
int cnt_digitos = 0;

void imprimir_resultados() {
    printf("Total de lineas: %d\n", total_lineas);
    printf("Total de palabras: %d\n", total_palabras);
    printf("Total de caracteres (incluidos espacios): %d\n", total_caracteres);
    printf("Total de palabras que inician con \"ni\": %d\n", cnt_inicia_ni);
    printf("Total de palabras que inician con \"num\": %d\n", cnt_inicia_num);
    printf("Total de palabras que inician con \"b\" y terminan con \"to\": %d\n", cnt_b_termina_to);
    printf("Total de palabras que terminan con \"jo\": %d\n", cnt_termina_jo);
    printf("Total de palabras que son digitos: %d\n", cnt_digitos);
}
%}

%option noyywrap

%%
\n              { total_lineas++; total_caracteres += yyleng; }
[ \t]+          { total_caracteres += yyleng; }
[0-9]+          { total_palabras++; total_caracteres += yyleng; cnt_digitos++; }
ni[a-zA-Z]*     { total_palabras++; total_caracteres += yyleng; cnt_inicia_ni++; }
num[a-zA-Z]*    { total_palabras++; total_caracteres += yyleng; cnt_inicia_num++; }
b[a-zA-Z]*to    { total_palabras++; total_caracteres += yyleng; cnt_b_termina_to++; }
[a-zA-Z]*jo     { total_palabras++; total_caracteres += yyleng; cnt_termina_jo++; }
[a-zA-Z]+       { total_palabras++; total_caracteres += yyleng; }
.               { total_caracteres += yyleng; }
%%

int main() {
    FILE *file;
    char name[] = "elbrutodelasmates.txt";
    file = fopen(name, "r");
    if (!file) {
        printf("Ocurrio un error al abrir el archivo.\n");
        return 1;
    }
    yyin = file;
    yylex();
    imprimir_resultados();
    fclose(file);
    return 0;
}
