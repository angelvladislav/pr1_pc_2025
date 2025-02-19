# #include <iostream>

# int main(void) {
#     int inferior, superior,i,j;
#     bool esPrimo;

#     std::cout << "\nPR1. Principios de Computadores.\n";
#     std::cout << "\nUn numero primo es un natural mayor que 1 que es divisble\n" 
#               << "unicamente entre 1 y el mismo. Este programa descubre los\n"
#               << "numero primos en un rango de numero naturales [a,b] siendo\n"
#               << "a y b naturales mayores que 1. El programa debera comprobar\n"
#               << "que se cumple ademas que b es mayor o igual que a y que son\n"
#               << "menores que 1001 para que ejecute en tiempo razonable.\n\n";
   
#     while (true) {
#         std::cout << "Introduce el limite inferior [a]: ";
#         std::cin >> inferior;
#         if ((inferior < 2) || (inferior > 1000)) {
#             std::cout << "Error, vuelve a introducir el rango.\n";
#             continue;
#         }
#         std::cout << "Introduce el limite superior [b]: ";
#         std::cin >> superior;
#         if ((superior < 2) || (superior < inferior) || (superior > 1000)) {
#             std::cout << "Error, vuelve a introducir el rango.\n";
#             continue;
#         }
#         break;
#     }

#     for (i = inferior; i <= superior; i++) {
#         esPrimo = true;
#         for (j = 2; j < i; j++) {
#             if (i % j == 0) {
#                 esPrimo = false;
#                 break;
#             }
#         }
#         if (esPrimo) {
#             std::cout << i << " ";
#         }
#     }
#     std::cout << "\nFin del programa.\n";
#     return 0;
# }

	.data
strTitulo:      .asciiz "\nPR1. Principios de Computadores.\n"
strInstruc1:    .asciiz "\nUn numero primo es un natural mayor que 1 que es divisble\n"
strInstruc2:    .asciiz "unicamente entre 1 y el mismo. Este programa descubre los\n"
strInstruc3:    .asciiz "numero primos en un rango de numero naturales [a,b] siendo\n"
strInstruc4:    .asciiz "a y b naturales mayores que 1. El programa debera comprobar\n"
strInstruc5:    .asciiz "que se cumple ademas que b es mayor o igual que a y que son\n"
strInstruc6:    .asciiz "menores que 1001 para que ejecute en tiempo razonable.\n\n";
strLimInf:      .asciiz "Introduce el limite inferior [a]: "
strLimSup:      .asciiz "Introduce el limite superior [b]: "
strErrorRango:  .asciiz "Error, vuelve a introducir el rango.\n"
strFin:         .asciiz "\nFin del programa.\n"

    .text

#######################################################
# Tabla de relacion de variables con registros
# inferior -> $s0
# superior -> $s1

# int main(void) {
main:

#     int inferior, superior,i,j;
#     bool esPrimo;

#     std::cout << "\nPR1. Principios de Computadores.\n";
    li      $v0,4
    la      $a0,strTitulo
    syscall

#     std::cout << "\nUn numero primo es un natural mayor que 1 que es divisble\n"
    li      $v0,4
    la      $a0,strInstruc1
    syscall

#               << "unicamente entre 1 y el mismo. Este programa descubre los\n"
    li      $v0,4
    la      $a0,strInstruc2
    syscall

#               << "numero primos en un rango de numero naturales [a,b] siendo\n"
    li      $v0,4
    la      $a0,strInstruc3
    syscall

#               << "a y b naturales mayores que 1. El programa debera comprobar\n"
    li      $v0,4
    la      $a0,strInstruc4
    syscall

#               << "que se cumple ademas que b es mayor o igual que a y que son\n"
    li      $v0,4
    la      $a0,strInstruc5
    syscall

#               << "menores que 1001 para que ejecute en tiempo razonable.\n\n";
    li      $v0,4
    la      $a0,strInstruc6
    syscall
   
#     while (true) {
while:

#         std::cout << "Introduce el limite inferior [a]: ";
    li      $v0,4
    la      $a0,strLimInf
    syscall

#         std::cin >> inferior;
    li      $v0,5
    syscall
    move    $s0,$v0

#         if ((inferior < 2) || (inferior > 1000)) {
ifInferior:
    bge     $s0,2,ifInferiorCondicion
    b       ifInferiorThen

ifInferiorCondicion:
    ble     $s0,1000,ifInferiorFin
    b       ifInferiorThen

#             std::cout << "Error, vuelve a introducir el rango.\n";
ifInferiorThen:
    li      $v0,4
    la      $a0,strErrorRango
    syscall
    b		while			
    
#             continue;
#         }

ifInferiorFin:
#         std::cout << "Introduce el limite superior [b]: ";
    li      $v0,4
    la      $a0,strLimSup
    syscall

#         std::cin >> superior;
    la      $v0,5
    syscall
    move    $s1,$v0

#         if ((superior < 2) || (superior < inferior) || (superior > 1000)) {
ifSuperior:
    bge     $s1,2,ifSuperiorCondicion1
    b       ifSuperiorThen

ifSuperiorCondicion1:
    bgt     $s1,$s0,ifSuperiorCondicion2
    b       ifInferiorThen

ifSuperiorCondicion2:
    ble     $s1,1000,ifSuperiorFin
    b       ifSuperiorThen

ifSuperiorThen:
#             std::cout << "Error, vuelve a introducir el rango.\n";
    li      $v0,4
    la      $a0,strErrorRango
    syscall
    b       while
#             continue;
#         }
#         break;
#     }
ifSuperiorFin:
#     for (i = inferior; i <= superior; i++) {
forFuera:
    ble     $s0,$s1,forDentro
    b       forFueraFin
    
#         esPrimo = true;
#         for (j = 2; j < i; j++) {
forDentro:
    blt     2,$s0,forPrimo
    b       forFueraFin
#             if (i % j == 0) {
#                 esPrimo = false;
#                 break;
#             }
#         }
#         if (esPrimo) {
#             std::cout << i << " ";
#         }
#

#     std::cout << "\nFin del programa.\n";
    li  $v0,4
    la  $a0,strFin
    syscall

#     return 0;
    li $v0,10
    syscall
# }