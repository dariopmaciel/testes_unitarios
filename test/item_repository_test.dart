import 'package:test/test.dart';
import 'package:testes_unitarios/item.dart';
import 'package:testes_unitarios/item_repository.dart';

void main() {
  test('F1 - Buscar todos Asyncrono - Não VAZIO - Forma 1', () async {
    //! PREPARAÇÃO
    var repository = ItemRepository();
    //! AÇÃO / EXECUÇÃO
    var buscar = await repository.buscarTodosAsync();
    //! VERIFICAÇÃO
    expect(buscar, isNotEmpty);
  });

  test('F2 - Buscar todos Syncrono - Não VAZIO - Forma 2', () {
    //! PREPARAÇÃO
    var repository = ItemRepository();
    //! AÇÃO / EXECUÇÃO
    var buscarTodos = repository.buscarTodosSync;
    //! VERIFICAÇÃO
    expect(buscarTodos(), completion(isNotEmpty));
  });

  test('F3 - Buscar ITEM por ID', () {
    //! PREPARAÇÃO
    var repository = ItemRepository();
    //! AÇÃO / EXECUÇÃO
    var item = repository.buscarPorId(1);
    //! VERIFICAÇÃO
    expect(item, Item(nome: 'Iphone', preco: 10000));
    expect(item, isNotNull);
  });
}
