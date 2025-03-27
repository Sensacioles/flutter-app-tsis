import 'package:flutter_test/flutter_test.dart';

Map<String, List<double>> alunos = {
  'Maria': [8.0, 9.0],
  'Bruna': [7.0, 7.0],
  'Carla': [10.0, 9.0],
};

//Metódo criado para transformar o dicionário no esperado pelo teste do exercício
//O dicionário deve:
//1) Adicionar Elena e Luiza;
//2) Remover a aluna Bruna;
//3) Atualizar as notas de Carla.
Map<String, List<double>> fixAlunos(Map<String, List<double>> map) {
  Map<String, List<double>> fixedMap = {};
  //Recebe a lista por parâmetro
  fixedMap = map;
  //Adiciona Elana e Luiza
  fixedMap.addAll({
    'Elena': [9.0, 8.0],
    'Luiza': [8.0, 9.0],
  });
  //Remove Bruna
  fixedMap.remove('Bruna');
  //Ajusta notas de Carla
  fixedMap.update('Carla', (value) => [9.0, 8.0]);
  return fixedMap;
}

/*void main() {
  test('Adicionar elemento', () {
    alunos.putIfAbsent('Elena', () => [9.0, 8.0]);
    expect(alunos.containsKey('Elena'), isTrue);
    expect(alunos['Elena'], [9.0, 8.0]);
  });
  test('Adicionar outro dicionário', () {
    alunos.addAll({
      'Elena': [9.0, 8.0],
      'Luiza': [8.0, 9.0],
    });
    expect(alunos.containsKey('Elena'), isTrue);
    expect(alunos.containsKey('Luiza'), isTrue);
  });
  test('Remover elemento', () {
    alunos.remove('Bruna');
    expect(alunos.containsKey('Bruna'), isFalse);
  });
  test('Atualizar elemento', () {
    alunos.update('Carla', (value) => [9.0, 8.0]);
    expect(alunos['Carla'], [9.0, 8.0]);
    alunos['Carla'] = [8.0, 9.0];
    expect(alunos['Carla'], [8.0, 9.0]);
  });
  test('Testar percorrer dicionário', () {
    expect(alunos.keys, ['Maria', 'Carla', 'Elena', 'Luiza']);
    expect(alunos.values, [
      [8.0, 9.0],
      [8.0, 9.0],
      [9.0, 8.0],
      [8.0, 9.0],
    ]);
    double soma = 0;
    alunos.forEach((key, value) {
      for (double nota in value) {
        soma += nota;
      }
    });
    expect(soma, 68.0);
  });
}*/

//Calcular a média de notas por mapping
void main() {
  test('Calcular médias', () {
    Map<String, double> medias = {};
    Map<String, List<double>> fixedAlunos = fixAlunos(alunos);
    fixedAlunos.forEach((key, value) {
      double soma = 0;
      int countNota = 0;
      for (double nota in value) {
        soma += nota;
        countNota += 1;
      }
      medias.putIfAbsent(key, () => (soma / countNota));
    });
    expect(medias, {'Maria': 8.5, 'Carla': 8.5, 'Elena': 8.5, 'Luiza': 8.5});
  });
}
