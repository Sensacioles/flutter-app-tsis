import 'package:flutter_test/flutter_test.dart';

Future<int> process() async {
  await Future.delayed(Duration(seconds: 5));
  return 0;
}

Map<String, List<double>> alunos = {
  'Maria': [8.0, 9.0],
  'Bruna': [7.0, 7.0],
  'Carla': [10.0, 9.0],
};

Future<List<double>?> search(String key) async {
  return Future.delayed(Duration(seconds: 2), () {
    if (alunos.containsKey(key)) {
      return alunos[key]!;
    }
    throw ArgumentError('Aluno não encontrado.');
  });
}

Stream<int> count() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

Stream<double> media(List<String> nomes) async* {
  for (String nome in nomes) {
    List<double>? notas = await search(nome);
    double media = 0;
    if (notas!.isNotEmpty) {
      for (double nota in notas) {
        media += nota;
      }
      media /= notas.length;
      yield media;
    }
  }
}
  void main() {
    group('Testes de programação assíncrona', () {
      test('Testando media em Stream', () {
        List<double> resultados = [];
        media(['Maria', 'Paula', 'Bruna']).listen(
          (resultado) {
            resultados.add(resultado);
          },
          onDone: () {
            expect(resultados, [8.5, 7]);
          },
          onError: (error) => expect(error, isA<ArgumentError>()),
        );
      });
    });
  }
