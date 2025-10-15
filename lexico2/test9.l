%option noyywrap
%{
    #include <stdio.h>
    #include "tokenss.h"
%}

%%

(analizar|comparar|examinar|distinguir|identificar|relacionar|diferenciar|clasificar|inferir|categorizar|descomponer|contrastar|investigar|organizar|detectar) { return TOKEN_BLOOM_ANALIZAR; }

(amable|bello|brillante|creativo|dedicado|eficiente|elegante|encantador|fuerte|generoso|honesto|inteligente|paciente|positivo|responsable|sabio|sincero|talentoso|valiente) { return TOKEN_ADJETIVO; }

("ya que"|"así que"|y|e|ni|o|u|pero|aunque|sino|porque|pues|mientras|cuando|si) { return TOKEN_CONJUNCION; }

(a|ante|bajo|con|contra|de|desde|en|entre|hacia|hasta|para|por|según|sin|sobre|tras) { return TOKEN_PREPOSICION; }

(yo|tú|él|ella|nosotros|ustedes|ellos|mío|tuyo|suyo|nuestro|vuestro|este|esa|aquellos|alguien|algo|nadie|ninguno|todos|varios|qué|quién|cuál|cuánto|que|quien|cuyo|donde) { return TOKEN_PRONOMBRE; }

%%

int main(void)
{
    int token;
    while ((token = yylex())) {
        switch(token) {
            case TOKEN_BLOOM_ANALIZAR:
                printf("Verbo Bloom - Analizar = %s\n", yytext);
                break;
            case TOKEN_ADJETIVO:
                printf("Adjetivo positivo = %s\n", yytext);
                break;
            case TOKEN_CONJUNCION:
                printf("Conjuncion = %s\n", yytext);
                break;
            case TOKEN_PREPOSICION:
                printf("Preposicion = %s\n", yytext);
                break;
            case TOKEN_PRONOMBRE:
                printf("Pronombre = %s\n", yytext);
                break;
        }
    }
    return 0;
}
