#include <iostream>

int main() {
    int num1, num2, suma, resta;

    // Solicitar el primer número
    std::cout << "Ingresa el primer numero: ";
    std::cin >> num1;

    // Solicitar el segundo número
    std::cout << "Ingresa el segundo numero: ";
    std::cin >> num2;

    // Realizar la suma
    suma = num1 + num2;

    // Realizar la resta
    resta = num1 - num2;

    // Mostrar los resultados
    std::cout << "La suma es: " << suma << std::endl;
    std::cout << "La resta es: " << resta << std::endl;

    return 0;
}