#include <iostream>

int main(void) {
    int inferior, superior,i,j;
    bool esPrimo;

    std::cout << "\nPR1. Principios de Computadores.\n";
    std::cout << "\nUn numero primo es un natural mayor que 1 que es divisble\n" 
              << "unicamente entre 1 y el mismo. Este programa descubre los\n"
              << "numero primos en un rango de numero naturales [a,b] siendo\n"
              << "a y b naturales mayores que 1. El programa debera comprobar\n"
              << "que se cumple ademas que b es mayor o igual que a y que son\n"
              << "menores que 1001 para que ejecute en tiempo razonable.\n\n";
   
    while (true) {
        std::cout << "Introduce el limite inferior [a]: ";
        std::cin >> inferior;
        if ((inferior < 2) || (inferior > 1000)) {
            std::cout << "Error, vuelve a introducir el rango.\n";
            continue;
        }
        std::cout << "Introduce el limite superior [b]: ";
        std::cin >> superior;
        if ((superior < 2) || (superior < inferior) || (superior > 1000)) {
            std::cout << "Error, vuelve a introducir el rango.\n";
            continue;
        }
        break;
    }

    for (i = inferior; i <= superior; i++) {
        esPrimo = true;
        for (j = 2; j < i; j++) {
            if (i % j == 0) {
                esPrimo = false;
                break;
            }
        }
        if (esPrimo) {
            std::cout << i << " ";
        }
    }
    std::cout << "\nFin del programa.\n";
    return 0;
}