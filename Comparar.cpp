#include <iostream>
#include <cstdio>
#include <cctype>  
using namespace std;

int main() {
    char cadena[256];
    char token[256];
    int i = 0, j = 0;

    cout << "Ingrese texto: ";
    if (!fgets(cadena, sizeof(cadena), stdin)) { 
        return 1; 
    }

    while (cadena[i] != '\0') {  
        if (cadena[i] != ' ' && cadena[i] != '\n') {
            token[j++] = cadena[i];
        } else {
            if (j > 0) {
                token[j] = '\0';
                
                bool let = true, num = true;
                for (int k = 0; token[k] != '\0'; k++) {
                    if (!isalpha((unsigned char)token[k])) let = false; 
                    if (!isdigit((unsigned char)token[k])) num = false;
                }
                if (let) {
                    cout << token << " -> PALABRA\n";
                } else if (num) {
                    cout << token << " -> ENTERO\n";
                } else {
                    cout << token << " -> COMPUESTA\n";
                }
                j = 0;
            }
        }
        i++;
    }


    return 0;
}
