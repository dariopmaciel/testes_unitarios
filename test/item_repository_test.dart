import 'package:test/test.dart';
import 'package:testes_unitarios/item_repository.dart';

void main() {
  test('F1 - Buscar todos Asyncrono - Não VAZIO - Forma 1', () async {
    //! PREPARAÇÃO
    var repository = ItemRepository();
    //! AÇÃO / EXECUÇÃO
    var buscar = await repository.buscarTodos();
    //! VERIFICAÇÃO
    expect(buscar, isNotEmpty);
  });

  test('F1 - Buscar todos Asyncrono - Não VAZIO - Forma 2', () {
    //! PREPARAÇÃO
    var repository = ItemRepository();
    //! AÇÃO / EXECUÇÃO
    var buscarTodos = repository.buscarTodos;
    //! VERIFICAÇÃO
    expect(buscarTodos(), completion(isNotEmpty));
  });
}
