import 'package:flutter_test/flutter_test.dart';

//1) Algoritmo para verificar se um número é perfeito
//Um número é perfeito se a soma dos divisores for igual a ele mesmo
//(ex: 6 = 1 + 2 + 3).
bool isPerfect(int num) {
  if (num < 1) return false;
  int sum = 0;
  for (int i = 1; i <= num ~/ 2; i++) {
    if (num % i == 0) {
      sum += i;
    }
  }
  return sum == num;
}

//2) Algoritmo para calcular o fatorial de um número
//O fatorial de um número é o produto do número por todos os
//antecessores positivos.
int factorial(int n) {
  if (n < 0) throw ArgumentError('Número deve ser não negativo.');
  int result = 1;
  int i = n;
  while (i > 1) {
    result *= i;
    i--;
  }
  return result;
}

//3) Exercício para verificar se um número é primo
//Um número que só pode ser dividido por um e por ele mesmo.
bool isPrime(int n) {
  if (n > 1) {
    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  } else {
    return false;
  }
}

//4) Exercício para calcular a soma dos dígitos
//Caso número negativo, dispare uma mensagem de erro
//(ex: 123, 1 + 2 + 3 = 6).
int sumDigit(int n) {
  if (n < 0) throw ArgumentError('Número deve ser não negativo.');
  int resultado = 0;
  int i = 0;
  for (n; i > 0; i = (i / 10).floor()) {
    resultado += (i % 10);
  }
  return resultado;
}

//Método main para testar função
void main() {
  //Bloco para teste de método isPrime(n)
  group('Testes de Numero Primo', () {
    test('13 é primo?', () {
      expect(isPrime(13), equals(true));
    });

    test('12 é primo?', () {
      expect(isPrime(13), equals(true));
    });
  });
  //Bloco para teste de método sumDigit(n)
  group('Testes de Soma de Dígitos', () {
    test('Somatório dos dígitos de 13411', () {
      expect(() => sumDigit(13411), throwsArgumentError);
    });
    test('Somatório dos dígitos de -247', () {
      expect(() => sumDigit(-247), throwsArgumentError);
    });
  });
}
