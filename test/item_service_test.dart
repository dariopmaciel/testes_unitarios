import 'package:test/test.dart';
import 'package:testes_unitarios/item.dart';
import 'package:testes_unitarios/item_repository.dart';
import 'package:testes_unitarios/item_service.dart';

class ItemRepositoryFake implements IItemRepository {
  @override
  Future<List<Item>> buscarTodosAsync() async {
    // throw Exception();
    return <Item>[];
  }

  @override
  List<Item> buscarTodosSync() {
    
    return [];
  }

  @override
  Item buscarPorId(int id) {
    return Item(nome: "Item teste ", preco: 10);
  }
}

class ItemRepositoryFakeException implements IItemRepository {
  @override
  Future<List<Item>> buscarTodosAsync() async {
    throw Exception();
    
  }

  @override
  List<Item> buscarTodosSync() {
    
    return [];
  }

  @override
  Item buscarPorId(int id) {
    return Item(nome: "Item teste ", preco: 10);
  }
}


void main() {
  test('Asyncrono - Buscar TODOS os Itens ...', () async {
    var service = ItemService(repository: ItemRepositoryFake());

    final items = await service.buscarTodosAsync();

    expect(items, <Item>[]);
  });

  test('Asyncrono - Buscar TODOS os Itens retornam uma EXCEPTION...',
      () async {
    var service = ItemService(repository: ItemRepositoryFakeException());

    final call = service.buscarTodosAsync;

    expect(call(), throwsException);
  });
}
